#ifndef SETTINGSSTORE_H
#define SETTINGSSTORE_H
#include <QSettings>

class SettingsStore
{
private:
    QSettings _settings;
public:
    SettingsStore();
};

#endif // SETTINGSSTORE_H
