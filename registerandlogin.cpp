#include "registerandlogin.h"
#include <QUrl>
#include <QHostAddress>


const int localPort = 1965;

RegisterAndLogin::RegisterAndLogin(QObject *parent) : QObject(parent)
{
    tcpServer = new QTcpServer(this);
    connect(tcpServer,SIGNAL(newConnection()), this, SLOT(onNewConnectionReceived()));
    connect(tcpServer,SIGNAL(acceptError(QAbstractSocket::SocketError)), this, SLOT(onErrorReceived(QAbstractSocket::SocketError)));
}

void RegisterAndLogin::onNewConnectionReceived()
{
  qDebug()<<"New Connection Slot Called";
  QTcpSocket *socket = tcpServer->nextPendingConnection();
  connect(socket,SIGNAL(readyRead()), this, SLOT(onDataAvailable()));

}

void RegisterAndLogin::onDataAvailable()
{
   QTcpSocket *sendingSocket = (QTcpSocket *)QObject::sender();
   QByteArray request_data = sendingSocket->readAll();
   QString requestString = QString::fromStdString(request_data.toStdString());
   QStringList requestSplitList = requestString.split("sessionId=");
   if(requestSplitList.count()>0)
   {
     _settings.setValue(SESSIONID_KEY, requestSplitList[1]);
     //head of http response

     std::string response = "HTTP/1.1 200 OK\r\n";
     response.append("Content-Type: application/json;\r\n");
     response.append("Access-Control-Allow-Origin:");
     response.append(SERVER_URL.toStdString());
     response.append("\r\n");

     response.append("\r\n");
     //body of http response
     QJsonObject responseObj;
     responseObj.insert("message", "success");
     QJsonDocument responseBody(responseObj);
     QByteArray bytes = responseBody.toJson();
     response.append(bytes);

     response.append("\r\n");
     //send that response
     sendingSocket->write(response.c_str());
   } else {

       //head of http response

       std::string response = "HTTP/1.1 200 OK\r\n";
       response.append("Content-Type: application/json;\r\n");
       response.append("Access-Control-Allow-Origin:");
       response.append(SERVER_URL.toStdString());
       response.append("\r\n");

       response.append("\r\n");
       //body of http response
       QJsonObject responseObj;
       responseObj.insert("message", "No Session Id Present");
       QJsonDocument responseBody(responseObj);
       QByteArray bytes = responseBody.toJson();
       response.append(bytes);

       response.append("\r\n");
       //send that response
       sendingSocket->write(response.c_str());
   }

}

void RegisterAndLogin::onErrorReceived(QAbstractSocket::SocketError socketError)
{
  qDebug()<<"Error when accepting New Connection"<<socketError;
}


RegisterAndLogin::~RegisterAndLogin()
{
   qDebug()<<"Register Destructer Called";
}

void RegisterAndLogin::onRegisterWithFbClicked()
{
    QHostAddress hostadd("127.0.0.1");
    tcpServer->listen(hostadd, localPort);
    QUrl url(FB_REQUEST_URL);
    QDesktopServices::openUrl(url);
    _settings.setValue(LASTTIME_LOGIN_WITH,FB_AUTH);
}

void RegisterAndLogin::onRegisterWithGoogleClicked()
{
    QHostAddress hostadd("127.0.0.1");
    tcpServer->listen(hostadd, localPort);
    QUrl url(GOOGLE_REQUEST_URL);
    QDesktopServices::openUrl(url);
    _settings.setValue(LASTTIME_LOGIN_WITH,GOOGLE_AUTH);
}

void RegisterAndLogin::onLoginButtonClicked(QString email, QString password)
{
   qDebug()<<"Value of Email Entered = "<<email<<",Value of password= "<<password;
   QUrl serverUrl(LOGIN_URL);
   QNetworkRequest request(serverUrl);
   request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");
   QJsonObject json;
   json.insert("email", email);
   json.insert("password", password);
   QJsonDocument doc(json);
   QByteArray bytes = doc.toJson();
   QNetworkAccessManager networkManager;
   connect(&networkManager, SIGNAL(finished(QNetworkReply*)),this, SLOT(networkRequestFinish(QNetworkReply*)));
   networkManager.post(request, bytes);
}

void RegisterAndLogin::networkRequestFinish(QNetworkReply *reply)
{
    qDebug()<<"Value of reply->readall()"<<reply->readAll();
}
