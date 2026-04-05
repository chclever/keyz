import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15

Page {
    id: root
    width: 800
    height: 500

    property var stackView: null

    property var mainPassword: "";
    
    property var userid: "";
    property var login: "";
    property var platform: "";
    property var status: "create";

    Component.onCompleted: {
        // Подключаем сигналы контроллера
        if (typeof controller !== 'undefined') {
            controller.sendUserPassword.connect(function(data) {
                console.log("[sendUserPassword]: data -> ", data);
                mainPassword = data;
            });

            console.log("userid: ", userid)

            controller.sendUpdatePasswordSuccess.connect(function() {

                console.log("[UpdatePassword]: Success");
                try { 
                    controller.handleRenderMainDataFromUser(userid); // refresh
                    stackView.pop("main.qml", { "userLogin" : userid , "stackView" : stackView });
                } catch(e) {
                    console.log(e)
                }
                // баг (не обновляется экран при переходе).

                // добавить обработку error.

            });

            controller.sendUpdatePasswordError.connect(function(comment) {
                console.log("'sendUpdatePasswordError': " + comment)
                errorText.text = "Ошибка: " + comment;

            });

            if (status == "edit") {
                console.log("'status' = edit")
                controller.handleRenderKeyDataFromUser( userid, login, platform );
            
            }

        } else {
            console.error("Controller is not defined!");
        }
    }



    Rectangle {
        anchors.fill: parent
        radius: 20
        color: "#000000"
        border.color: "#333333"
        border.width: 2
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.bottomMargin: 30
        anchors.topMargin: 150        // ← СИЛЬНО БОЛЬШЕ ОТСТУП
        spacing: 35

        // ЛОГИН
        RowLayout {
            spacing: 20
            Layout.fillWidth: true

            Label {
                text: "Логин"
                font.pixelSize: 28
                Layout.preferredWidth: 150
                color: "white"
            }

            TextField {
                id: loginField
                Layout.fillWidth: true
                font.pixelSize: 22
                color: "white"
                text: login
                background: Rectangle {
                    radius: 8
                    color: "transparent"
                    border.color: "#A020F0"
                    border.width: 2
                }

                onTextChanged: {
                    login = loginField.text
                                    
                    if (errorText.text !== "") {
                        errorText.text = "";
                    }
                }
            }

            // copy icon
            Rectangle {
                width: 28; height: 28
                radius: 4
                border.color: "#000000"
                border.width: 2
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    source: "images/copy.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        // ПЛАТФОРМА
        RowLayout {
            spacing: 20
            Layout.fillWidth: true

            Label {
                text: "Платформа"
                font.pixelSize: 28
                Layout.preferredWidth: 150
                color: "white"
            }

            TextField {
                id: platformField
                Layout.fillWidth: true
                font.pixelSize: 22
                color: "white"
                text: platform
                background: Rectangle {
                    radius: 8
                    color: "transparent"
                    border.color: "#A020F0"
                    border.width: 2
                }
             
                onTextChanged: {
                    
                    if (errorText.text !== "") {
                        errorText.text = "";
                    }

                    platform = platformField.text
                }
            }

            Rectangle {
                width: 28; height: 28
                radius: 4
                border.color: "#000000"
                border.width: 2
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    source: "images/copy.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        // ПАРОЛЬ
        // TO DO: научиться получать пороль, протестить редактированиеподключить реакцию qml на создание и редактирование, пофиксить фото кота и refresh list. 

        RowLayout {
            spacing: 20
            Layout.fillWidth: true

            Label {
                text: "Пароль"
                font.pixelSize: 28
                Layout.preferredWidth: 150
                color: "white"
            }

            TextField {
                id: passwordField
                Layout.fillWidth: true
                font.pixelSize: 22
                color: "white"
                text: mainPassword
                background: Rectangle {
                    radius: 8
                    color: "transparent"
                    border.color: "#A020F0"
                    border.width: 2
                }

                onTextChanged: {
                                    
                    if (errorText.text !== "") {
                        errorText.text = "";
                    }

                    mainPassword = passwordField.text
                
                }
            }

            Rectangle {
                width: 28; height: 28
                radius: 4
                border.color: "#000000"
                border.width: 2
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    source: "images/copy.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        // НИЖНИЕ КНОПКИ
        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            // Назад
            Rectangle {
                width: 50; height: 50
                radius: 10
                border.color: "red"
                border.width: 2
                color: "transparent"

                Text {
                    anchors.centerIn: parent
                    text: "<"
                    color: "red"
                    font.pixelSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stackView.pop("main.qml", { "userLogin": userid , "stackView" : stackView });
                    }
                }
            }

            Text {
                id: errorText
                width: parent.width
                height: 30
                text: ""
                color: '#ff0000'
                font.pixelSize: 25
                font.family: "Verdana"
                font.weight: Font.DemiBold
                horizontalAlignment: Text.AlignHCenter
                visible: text !== ""
                // УДАЛЕНО: controller.sendError.connect - это было неправильно
            }

            // Сохранить
            Rectangle {
                Layout.fillWidth: true
                height: 50
                radius: 10
                border.color: "#3BAF45"
                border.width: 2
                color: "transparent"

                Text {
                    anchors.centerIn: parent
                    text: "Сохранить"
                    color: "#3BAF45"
                    font.pixelSize: 28
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: { 
                        console.log(userid, login, mainPassword, platform)
                        if (status == "edit") { 
                            controller.handleUpdatePassword(userid, login, mainPassword, platform); 
                            console.log("[ --- EDIT --- ] ->>" + userid, login, platform, mainPassword);
                        }
                        else if (status == "create") { 
                            controller.handleCreatePassword(userid, login, mainPassword, platform);
                        }
                    }
                }
            }

            // Удалить
            Rectangle {
                width: 50; height: 50
                radius: 10
                border.color: "#0e0000"
                border.width: 2
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    width: 32
                    height: 32
                    source: "images/free-icon-bin-5375931.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    Image {
        id: _358af2f7E6744c48B7b59f303da7e1eb_removalai_preview
        x: -81
        y: -41
        width: 283
        height: 212
        source: "images/358af2f7-e674-4c48-b7b5-9f303da7e1eb_removalai_preview.png"
        fillMode: Image.PreserveAspectFit
    }
}
