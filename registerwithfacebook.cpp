#include "registerwithfacebook.h"
#include "o0globals.h"

const QString FB_APP_KEY = "227896037359072";
const QString FB_APP_SECRET = "3d35b063872579cf7213e09e76b65ceb";

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

  connect(o2Facebook_, SIGNAL(linkedChanged()), this, SLOT(onLinkedChanged()));
  connect(o2Facebook_, SIGNAL(linkingFailed()), this, SIGNAL(linkingFailed()));
  connect(o2Facebook_, SIGNAL(linkingSucceeded()), this, SLOT(onLinkingSucceeded()));
  connect(o2Facebook_, SIGNAL(openBrowser(QUrl)), this, SLOT(onOpenBrowser(QUrl)));
  connect(o2Facebook_, SIGNAL(closeBrowser()), this, SLOT(onCloseBrowser()));
}

RegisterWithFacebook::~RegisterWithFacebook()
{
   qDebug()<<"Register With Facebook Destructer Called";
}

void RegisterWithFacebook::onRegisterWithFbClicked()
{
   qDebug()<<"Register With Facebook Slot Called";
}
