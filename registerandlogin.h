#ifndef REGISTER_H
#define REGISTER_H

#include <QObject>
#include <QDebug>
#include <QString>
#include <QDesktopServices>
#include <QUrl>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QNetworkAccessManager>
#include <QJsonObject>
#include <QJsonDocument>
#include <QTcpServer>

#include "constants.h"
#include "settingsstore.h"

class RegisterAndLogin : public QObject
{
    Q_OBJECT
private:
    QTcpServer *tcpServer;

public:
    QSettings _settings;
    explicit RegisterAndLogin(QObject *parent = nullptr);
    ~RegisterAndLogin();

signals:
    void showMessageToRegister();
    void loginSuccessfull();

public slots:
    void onRegisterWithFbClicked();
    void onDataAvailable();
    void onRegisterWithGoogleClicked();
    void onNewConnectionReceived();
    void onErrorReceived(QAbstractSocket::SocketError socketError);
    void onLoginButtonClicked(QString email, QString password);
    void networkRequestFinish(QNetworkReply*);
};

#endif // REGISTERWITHFACEBOOK_H
