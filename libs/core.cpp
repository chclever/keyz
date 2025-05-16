#include "core.h"

using namespace nlohmann;

json Core::read_base() {
    std::ifstream user_db_read("base.json");

    json current_data;

    if (user_db_read.is_open()) {
        current_data = json::parse(user_db_read);
        
        user_db_read.close();
    } else {
        throw std::runtime_error("[X]: Error reading the database.");
    }

    return current_data;
}

AddResponse Core::add_user_password(const AddRequest& data) {
    
    AddResponse r;
    std::ifstream user_db_read("base.json");

    json current_data;

    try {
        current_data = this->read_base();
    } catch (const std::exception& e) {
        r.code = 501;
        r.comment = e.what();
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

GetResponse Core::get_user_password(const GetRequest& data) {
    GetResponse r;

    bool is_ud_found = false;

    json current_data;

    try {
        current_data = this->read_base();
    } catch (const std::exception& e) {
        r.code = 501;
        r.comment = e.what();
        return r;
    }
    
    for (auto &item : current_data[data.userid]) {
        if ( data.login == item.at("login").get<std::string>() && data.platform == item.at("platform").get<std::string>() ) {
            r.code = 200;
            r.comment = "Passwd found!";
            r.password = item.at("password");
            is_ud_found = true;
        }
    }

    if (!is_ud_found) {
        r.code = 404;
        r.comment = "Passwd not found!";
        r.password = "?";
    }

    return r;   
}