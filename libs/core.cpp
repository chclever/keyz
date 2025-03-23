#include "core.h"

using namespace nlohmann;

// Добавляем пароль пользователя в файл
AddResponse Core::add_user_password(const AddRequest& data) {
    
    AddResponse r;
    r.code = 200;
    r.comment = "Successful!!!";

    std::ifstream user_db_read("base.json");

    json current_data;
    
    if (user_db_read.is_open()) {
        current_data = json::parse(user_db_read);
        user_db_read.close();
    } else {
        r.code = 501;
        r.comment = "[Error] Write data";

        return r;
    }

    std::ofstream user_db_write("base.json");
    
    if (user_db_write.is_open()) {
    
            current_data[data.userid] = {
                {"platform",    data.platform},
                {"login",       data.login},
                {"password",    data.password}
            };
    
            user_db_write << current_data.dump(4) << std::endl;
            user_db_write.close();
    } else {
        r.code = 502;
        r.comment = "[Error] Write data";
        
        return r;
    }

    return r;
}
