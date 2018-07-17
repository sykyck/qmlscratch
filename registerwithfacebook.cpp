#include "registerwithfacebook.h"

RegisterWithFacebook::RegisterWithFacebook(QObject *parent) : QObject(parent)
{
  qDebug()<<"Register With Facebook Constructer Called";
}

RegisterWithFacebook::~RegisterWithFacebook()
{
   qDebug()<<"Register With Facebook Destructer Called";
}

void RegisterWithFacebook::onRegisterWithFbClicked()
{
   qDebug()<<"Register With Facebook Slot Called";
}
