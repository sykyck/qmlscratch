#include "registerwithfacebook.h"
#include "o0globals.h"

const QString FB_APP_KEY = "267562924014185";
const QString FB_APP_SECRET = "a40b46cb19ad5009519e93a83aa20c84";

const QString FB_REQUEST_URL = "https://www.facebook.com/dialog/oauth";
const char FB_DEBUG_TOKEN[] = "https://graph.facebook.com/me?fields=id&access_token=%1";

const int localPort = 1965;

RegisterWithFacebook::RegisterWithFacebook(O0SettingsStore *store, QObject *parent) : QObject(parent)
{
  qDebug()<<"Register With Facebook Constructer Called";
  o2Facebook_ = new O2Facebook(this);

  o2Facebook_->setClientId(FB_APP_KEY);
  o2Facebook_->setClientSecret(FB_APP_SECRET);
  o2Facebook_->setLocalPort(localPort);
  o2Facebook_->setRequestUrl(FB_REQUEST_URL);

  // Create a store object for writing the received tokens
  store->setGroupKey("facebook");
  o2Facebook_->setStore(store);

  connect(o2Facebook_, SIGNAL(openBrowser(QUrl)), this, SLOT(onOpenBrowser(QUrl)));
  connect(o2Facebook_, SIGNAL(closeBrowser()), this, SLOT(onCloseBrowser()));
  connect(this, SIGNAL(linkingFailed()), this, SLOT(onLinkingFailed()));
  connect(this, SIGNAL(linkingSucceeded()), this, SLOT(onLinkingSucceeded()));
}

RegisterWithFacebook::~RegisterWithFacebook()
{
   qDebug()<<"Register With Facebook Destructer Called";
}

void RegisterWithFacebook::onLinkingFailed() {
    qDebug()<<"OnLinkingFailed Called";
    emit showMessageToRegister();
}

void RegisterWithFacebook::onLinkingSucceeded() {
   qDebug()<<"OnLinkingSucceeded Called";
}

void RegisterWithFacebook::doOAuth(O2::GrantFlow grantFlowType) {
   // qDebug() << "Starting OAuth 2 with grant flow type" << GRANTFLOW_STR(grantFlowType) << "...";
    o2Facebook_->setGrantFlow(grantFlowType);
    o2Facebook_->unlink();
    o2Facebook_->link();
}

void RegisterWithFacebook::onRegisterWithFbClicked()
{
   qDebug()<<"Register With Facebook Slot Called";
   this->doOAuth(O2::GrantFlow::GrantFlowAuthorizationCode);
}

void RegisterWithFacebook::onOpenBrowser(QUrl url)
{
   qWarning()<<"Url To Open = "<<url;
   QDesktopServices::openUrl(url);
}

void RegisterWithFacebook::validateToken() {
    if (!o2Facebook_->linked()) {
        qWarning() << "ERROR: Application is not linked!";
        emit linkingFailed();
        return;
    }

    QString accessToken = o2Facebook_->token();
    QString debugUrlStr = QString(FB_DEBUG_TOKEN).arg(accessToken);
    QNetworkRequest request = QNetworkRequest(QUrl(debugUrlStr));
    QNetworkAccessManager *mgr = new QNetworkAccessManager(this);
    QNetworkReply *reply = mgr->get(request);
    connect(reply, SIGNAL(finished()), this, SLOT(onFinished()));
    qDebug() << "Validating user token. Please wait...";
}

void RegisterWithFacebook::onFinished() {
    QNetworkReply *reply = qobject_cast<QNetworkReply *>(sender());
    if (!reply) {
        qWarning() << "NULL reply!";
        emit linkingFailed();
        return;
    }

    reply->deleteLater();
    if (reply->error() != QNetworkReply::NoError) {
        qWarning() << "Reply error:" << reply->error();
        qWarning() << "Reason:" << reply->errorString();
        emit linkingFailed();
        return;
    }

    QByteArray replyData = reply->readAll();
    bool valid = !replyData.contains("error");
    if (valid) {
        qDebug() << "Token is valid";
        emit linkingSucceeded();
    } else {
        qDebug() << "Token is invalid";
        emit linkingFailed();
    }
}
