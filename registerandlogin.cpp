#include "registerandlogin.h"
#include <QUrl>


const int localPort = 1965;

RegisterAndLogin::RegisterAndLogin(QObject *parent) : QObject(parent)
{
}

RegisterAndLogin::~RegisterAndLogin()
{
   qDebug()<<"Register Destructer Called";
}

void RegisterAndLogin::onRegisterWithFbClicked()
{
    QUrl url(FB_REQUEST_URL);
    QDesktopServices::openUrl(url);
    _settings.setValue(LASTTIME_LOGIN_WITH,FB_AUTH);
}

void RegisterAndLogin::onRegisterWithGoogleClicked()
{
    QUrl url(GOOGLE_REQUEST_URL);
    QDesktopServices::openUrl(url);
    _settings.setValue(LASTTIME_LOGIN_WITH,GOOGLE_AUTH);
}

void RegisterAndLogin::onLoginButtonClicked(QString email, QString password)
{
   qDebug()<<"Value of Email Entered = "<<email<<",Value of password= "<<password;
   QUrl serverUrl(SERVER_URL);
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