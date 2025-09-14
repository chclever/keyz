#include "includes.h"
#include "core.h"


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

void init_main() {
    auto core = new Core();
    std::cout << "Started at: " << time_now() << std::endl;

    AddRequest r;
    AddRequest n;
    GetRequest s;
    GetPasswdListResponse gs;

    n.userid = "ZXCZXCZXCZXCZXCZXCXZC";
    n.platform = "Steam";
    n.login = "Salat";
    n.password = "123321";
    
    r.userid = "QAZXSWEDCVFRTGBNHYUJMKIOL";
    r.platform = "EpicGames";
    r.login = "Tefteli";
    r.password = "21321313131";
    
    s.userid = "QAZXSWEDCVFRTGBNHYUJMKIOL";
    s.login = "Tefteli";
    s.platform = "EpicGames";


    auto ret = core->add_user_password(r);
    auto ret1 = core->add_user_password(n);
    
    r.userid = "QAZXSWEDCVFRTGBNHYUJMKIOL";
    r.platform = "Steam ";
    r.login = "Testlogin";
    r.password = "Bobrito";
    
    auto ret2 = core->add_user_password(r);
    // GetResponse
    auto ret3 = core->get_user_password(s);

    std::cout << "- AddResponse | [INFO]: " << ret.code << " -> " << ret.comment << std::endl;
    std::cout << "- AddResponse | [INFO]: " << ret1.code << " -> " << ret1.comment << std::endl;

    std::cout << "- AddResponse | [INFO]: " << ret2.code << " -> " << ret2.comment << std::endl;
    std::cout << "- GetResponse | [INFO]: " << ret3.code << " -> " << ret3.comment << " Passwd: " << ret3.password << std::endl;
    
    auto ret_get = core->get_user_data(n.userid);

    for (auto &item : ret_get.password_data) { 
        std::cout << "- GetPasswdListResponse | [INFO]: " << "Login: " << item.login << " Platform: " << item.platform  << std::endl;
    }

    std::cout << "- GetPasswdListResponse | [INFO]: Code: " << ret_get.code << " Comment: " << ret_get.comment << std::endl;
    
    std::cout << "\n******\n[INFO] Finished." << std::endl;

    std::cout << "Starting menu..." << std::endl;

    
    simple_menu();
}