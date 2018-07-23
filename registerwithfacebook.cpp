#include "registerwithfacebook.h"
#include "o0globals.h"

const QString FB_APP_KEY = "267562924014185";
const QString FB_APP_SECRET = "a40b46cb19ad5009519e93a83aa20c84";

const QString FB_REQUEST_URL = "https://www.facebook.com/dialog/oauth";

RegisterWithFacebook::RegisterWithFacebook(QObject *parent) : QObject(parent)
{
  qDebug()<<"Register With Facebook Constructer Called";
  o2Facebook_ = new O2Facebook(this);

  o2Facebook_->setClientId(FB_APP_KEY);
  o2Facebook_->setClientSecret(FB_APP_SECRET);
  //o2Facebook_->setLocalPort(localPort);
  o2Facebook_->setRequestUrl(FB_REQUEST_URL);

  // Create a store object for writing the received tokens
  O0SettingsStore *store = new O0SettingsStore(O2_ENCRYPTION_KEY);
  store->setGroupKey("facebook");
  o2Facebook_->setStore(store);

  connect(o2Facebook_, SIGNAL(openBrowser(QUrl)), this, SLOT(onOpenBrowser(QUrl)));
  connect(o2Facebook_, SIGNAL(closeBrowser()), this, SLOT(onCloseBrowser()));
}

RegisterWithFacebook::~RegisterWithFacebook()
{
   qDebug()<<"Register With Facebook Destructer Called";
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
