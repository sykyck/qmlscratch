#include "QAbstractOAuth2Derived.h"

QAbstractOAuth2Derived::QAbstractOAuth2Derived(QString clientIdentifier, QObject *parent) : QObject(parent)
{
  qDebug()<<"QAbstractOAuth2Derived Constructer Called";
}
