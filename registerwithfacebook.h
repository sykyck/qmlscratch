#ifndef REGISTERWITHFACEBOOK_H
#define REGISTERWITHFACEBOOK_H

#include <QObject>
#include <QDebug>

#include <QtNetworkAuth/QOAuthHttpServerReplyHandler>
#include <QtNetworkAuth/QOAuth2AuthorizationCodeFlow>
class QAbstractOAuth;
class RegisterWithFacebook : public QObject
{
    Q_OBJECT
public:
    explicit RegisterWithFacebook(QObject *parent = nullptr);
    ~RegisterWithFacebook();

public slots:
    void onStatusChanged(QAbstractOAuth::Status status);
    void onRegisterWithFbClicked();
    void onAuthorizeWithBrowser(QUrl url);
    void onAuthorizationGranted();

private:
    QOAuth2AuthorizationCodeFlow *oauth2;
};

#endif // REGISTERWITHFACEBOOK_H
