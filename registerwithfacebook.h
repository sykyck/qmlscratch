#ifndef REGISTERWITHFACEBOOK_H
#define REGISTERWITHFACEBOOK_H

#include <QObject>
#include <QDebug>
#include <QString>

#include "OAuth/QAbstractOAuth2Derived.h"

class RegisterWithFacebook : public QObject
{
    Q_OBJECT
public:
    explicit RegisterWithFacebook(QObject *parent = nullptr);
    ~RegisterWithFacebook();

public slots:
    void onRegisterWithFbClicked();

private:
    QAbstractOAuth2Derived oauth2;
};

#endif // REGISTERWITHFACEBOOK_H
