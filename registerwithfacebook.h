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
    explicit RegisterWithFacebook(QObject *parent = nullptr);
    ~RegisterWithFacebook();
    void doOAuth(O2::GrantFlow grantFlowType);

public slots:
    void onRegisterWithFbClicked();
    void onOpenBrowser(QUrl url);

private:
    O2Facebook *o2Facebook_;
};

#endif // REGISTERWITHFACEBOOK_H
