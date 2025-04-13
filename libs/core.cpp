#include "core.h"

using namespace nlohmann;

AddResponse Core::add_user_password(const AddRequest& data) {
    
    AddResponse r;
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

    r.code = 200;
    r.comment = "Successful!!!";

    if (!user_db_write.is_open()) {
        r.code = 502;
        r.comment = "[Error] Write data";
        return r;
    }

    bool is_ud_found = false;
        
    json user_data = {
        {"platform",    data.platform},
        {"login",       data.login},
        {"password",    data.password}
    };

    if (current_data.contains(data.userid)) {
        for (auto &item : current_data[data.userid]) {
            if ( user_data.at("login") == item.at("login") && user_data.at("platform") == item.at("platform")) {
                item.at("password") = user_data.at("password");
                is_ud_found = true;
            }
        }
        if (!is_ud_found) {
            current_data[data.userid].push_back(user_data);
        }
    } else { 
        current_data[data.userid] = { user_data };
    }

    user_db_write << current_data.dump(4) << std::endl;
    user_db_write.close();

    return r;
}
