#ifndef REGISTERWITHFACEBOOK_H
#define REGISTERWITHFACEBOOK_H

#include <QObject>
#include <QDebug>
#include <QtNetworkAuth/QOAuthHttpServerReplyHandler>
#include <QtNetworkAuth/QOAuth2AuthorizationCodeFlow>

class RegisterWithFacebook : public QObject
{
    Q_OBJECT
public:
    QOAuth2AuthorizationCodeFlow oauth2;
    explicit RegisterWithFacebook(QObject *parent = nullptr);
    ~RegisterWithFacebook();

public slots:
    void onStatusChanged(QAbstractOAuth::Status status);
    void onRegisterWithFbClicked();
    void onAuthorizeWithBrowser(QUrl url);

};

#endif // REGISTERWITHFACEBOOK_H
