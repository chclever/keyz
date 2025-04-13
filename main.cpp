#include "libs/includes.h"
#include "libs/core.h"

std::string time_now() {
    std::time_t t = std::time(0);   // get time now
    std::tm* now = std::localtime(&t);

    std::string formated_time = "[" + std::to_string(now->tm_hour) + ":" + std::to_string(now->tm_min) + ":" + std::to_string(now->tm_sec) + "]";
    return formated_time;
}

// .add <id> <pl> <login> <pass> | https://github.com/chclever/FirstRepository/blob/master/Split/Split.cpp

int main() {
    auto core = new Core();
    std::cout << "Started at: " << time_now() << std::endl;

    AddRequest r;
    AddRequest n;

    n.userid = "ZXCZXCZXCZXCZXCZXCXZC";
    n.platform = "Steam";
    n.login = "Salat";
    n.password = "123321";
    
    r.userid = "QAZXSWEDCVFRTGBNHYUJMKIOL";
    r.platform = "EpicGames";
    r.login = "Tefteli";
    r.password = "21321313131";
    
    auto ret = core->add_user_password(r);
    auto ret1 = core->add_user_password(n);
    
    r.userid = "QAZXSWEDCVFRTGBNHYUJMKIOL";
    r.platform = "Steam ";
    r.login = "Testlogin";
    r.password = "Bobrito";
    
    auto ret2 = core->add_user_password(r);

    std::cout << "[AUP]: Statusek -> " << ret.code << " Comma -> " << ret.comment << std::endl;
    std::cout << "[AUP]: Status -> " << ret1.code << " Comma -> " << ret1.comment << std::endl;

    std::cout << "[AUP]: Status -> " << ret2.code << " Comma -> " << ret2.comment << std::endl;
    std::cout << "Finished" << std::endl;
    return 0;
}
