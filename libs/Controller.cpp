#include "Controller.h"

Controller::Controller(Core &core, QObject *parent) : QObject(parent) , core(core) {}

void Controller::handleLogin(const QString &text) {

    // check login 

    auto data = this->core.get_user_data(text.toStdString()); 
    std::cout << "--- response code: " << data.code 
    <<  "\n--- comment: " << data.comment 
    << "\n--- StdText: "  << text.toStdString() << std::endl;
    
}
