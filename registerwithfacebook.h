#ifndef REGISTERWITHFACEBOOK_H
#define REGISTERWITHFACEBOOK_H

#include <QObject>
#include <QDebug>

class RegisterWithFacebook : public QObject
{
    Q_OBJECT
public:
    explicit RegisterWithFacebook(QObject *parent = nullptr);
    ~RegisterWithFacebook();
signals:

public slots:
    void onRegisterWithFbClicked();

};

#endif // REGISTERWITHFACEBOOK_H
