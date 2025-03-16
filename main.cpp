#include "libs/includes.h"
#include "libs/core.h"

std::string time_now() {
    std::time_t t = std::time(0);   // get time now
    std::tm* now = std::localtime(&t);

    std::string formated_time = "[" + std::to_string(now->tm_hour) + ":" + std::to_string(now->tm_min) + ":" + std::to_string(now->tm_sec) + "]";
    return formated_time;
}


int main() {
    auto core = new Core();
    std::cout << "Hi: " << time_now() << std::endl;

    AddRequest r;

    r.userid = "QAZXSWEDCVFRTGBNHYUJMKIOL";
    r.platform = "EpicGames";
    r.login = "Tefteli";
    r.password = "kjasdl.asjd;aslkdjsa;ljds;alkjd;lskj";

    core->add_user_password(r);

    return 0;
}
