#include "libs/includes.h"
#include "libs/core.h"
#include "libs/init.h"
#include <QQmlContext>
#include "libs/Controller.h"  // Подключаем заголовочный файл

int main(int argc, char *argv[]) {

    auto core = new Core();
    std::cout << "Started at: " << time_now() << std::endl;

    AddRequest user_admin;

    user_admin.userid = "admin";
    user_admin.login = "administrator";
    user_admin.password = "admin123";
    user_admin.platform = "linux-ssh-server";

    auto register_admin = core->add_user_password(user_admin);  

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    
    auto controller = new Controller(*core);

    engine.rootContext()->setContextProperty("controller", controller);
    
    engine.load(QUrl("qrc:/UI/auth.qml")); 
    return app.exec();
}   
