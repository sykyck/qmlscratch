#include "register.h"
#include <QUrl>

const int localPort = 1965;

Register::Register(QObject *parent) : QObject(parent)
{
}

Register::~Register()
{
   qDebug()<<"Register Destructer Called";
}

void Register::onRegisterWithFbClicked()
{
    QUrl url(FB_REQUEST_URL);
    QDesktopServices::openUrl(url);
    _settings.setValue(LASTTIME_LOGIN_WITH,FB_AUTH);
}

void Register::onRegisterWithGoogleClicked()
{
    QUrl url(GOOGLE_REQUEST_URL);
    QDesktopServices::openUrl(url);
    _settings.setValue(LASTTIME_LOGIN_WITH,GOOGLE_AUTH);
}

