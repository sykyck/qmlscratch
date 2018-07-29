#ifndef REGISTERWITHFACEBOOK_H
#define REGISTERWITHFACEBOOK_H

#include <QObject>
#include <QDebug>
#include <QString>
#include <QDesktopServices>

#include "OAuth/o2facebook.h"
#include "o0settingsstore.h"

class RegisterWithFacebook : public QObject
{
    Q_OBJECT
public:
    O2Facebook *o2Facebook_;
    explicit RegisterWithFacebook(O0SettingsStore *store, QObject *parent = nullptr);
    ~RegisterWithFacebook();
    void doOAuth(O2::GrantFlow grantFlowType);
    void validateToken();

signals:
    void linkingSucceeded();
    void linkingFailed();
    void showMessageToRegister();

public slots:
    void onRegisterWithFbClicked();
    void onFinished();
    void onOpenBrowser(QUrl url);

};

#endif // REGISTERWITHFACEBOOK_H
