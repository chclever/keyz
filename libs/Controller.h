#include "core.h"

#include <QObject>
#include <QString>

class Controller : public QObject
{
    Q_OBJECT

public:
    Controller(Core &core, QObject *parent = nullptr);

private:
    Core &core;

public slots:
    void handleLogin(const QString &text);
};
