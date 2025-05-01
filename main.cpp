#include "libs/includes.h"
#include "libs/core.h"

std::string time_now() {
    std::time_t t = std::time(0);   // get time now
    std::tm* now = std::localtime(&t);

    std::string formated_time = "[" + std::to_string(now->tm_hour) + ":" + std::to_string(now->tm_min) + ":" + std::to_string(now->tm_sec) + "]";
    return formated_time;
}

void simple_menu() {

    struct cmd_input_data
    {
        std::string command;
        std::string uid;
        std::string uplatform;
        std::string ulogin;
        std::string upass;
    };
    
    while (true)    {
        
        std::string n;
        std::cout << "[C]: Enter command: ";
        std::cin >> n;

        // split

        if (n == "exit") {exit(0);}
        else {std::cout << "[E]: Command was ignored, sorry" << std::endl;};
    }
    
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

    std::cout << "[INFO]: " << ret.code << " -> " << ret.comment << std::endl;
    std::cout << "[INFO]: " << ret1.code << " -> " << ret1.comment << std::endl;

    std::cout << "[INFO]: " << ret2.code << " -> " << ret2.comment << std::endl;
    std::cout << "\n******\n[INFO] Finished." << std::endl;

    std::cout << "Starting menu..." << std::endl;


    simple_menu();

    return 0;
}
