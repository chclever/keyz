#include "libs/includes.h"
#include "libs/core.h"
#include "libs/init.h"
#include <QQmlContext>
#include "libs/Controller.h"  // Подключаем заголовочный файл

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<Controller>("Controller", 1, 0, "Controller");
    
    Controller controller;
    engine.rootContext()->setContextProperty("controller", &controller);
    
    engine.load(QUrl("qrc:/UI/auth.qml")); 
    return app.exec();
}
