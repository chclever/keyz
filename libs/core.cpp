#include "core.h"

using namespace nlohmann;

// Добавляем пароль пользователя в файл
AddResponse Core::add_user_password(AddRequest data) {
    std::ofstream user_db("base.json", std::ios::app);
    
    json user_template = {
        {   data.userid, {
                {"platform",    data.platform},
                {"login",       data.login},
                {"password",    data.password}
        }} 
    };

    // std::cout << user_template.dump() << std::endl;
    if (user_db.is_open()) {

        user_db << user_template.dump() << std::endl;

        std::cout << "Finished." << std::endl;
        
        user_db.close();
    } else {
        std::cout << "Error detected!" << std::endl;
    }
}

/*
base.json:

userid : [{
    <platform>: "",
    
    <login>: "",
    <password>: "",
}]

{
    "STR0rBiSCv1ue9MIKjUQ8qkhpx1WL75R4KxaFc9C" : [{
        "platform": "Steam",
        
        "login": "tefteli2011",
        "password": "supersecret123"
    }, {
        "platform": "EpicGames",
        
        "login": "tefteli1800",
        "password": "supersecret12334"
    }]
}

*/