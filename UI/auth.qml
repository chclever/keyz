import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

Rectangle {
    id: auth
    width: 800
    height: 500
    color: "#000000"

    property var stackView: null

    Component.onCompleted: {
        // Подключаем сигналы контроллера
        if (typeof controller !== 'undefined') {
            controller.sendError.connect(function(errorCode, errorMessage) {
                console.log("Ошибка:", errorCode, errorMessage);
                errorText.text = "Ошибка " + errorCode + ": " + errorMessage;
            });

            controller.sendLogin.connect(function(login){
                console.log("Успешный вход:", login);
                stackView.push("main.qml", { "userLogin" : login , "stackView" : stackView })
            })
            
        } else {
            console.error("Controller is not defined!");
        }
    }   

    Column {
        id: mainColumn
        anchors.fill: parent
        anchors.margins: 30
        spacing: 20

        // Заголовок
        Text {
            id: titleText
            width: parent.width
            color: "#ffffff"
            text: qsTr("Авторизуйтесь:")
            font.pixelSize: 50
            horizontalAlignment: Text.AlignHCenter
            font.styleName: "Bold"
            font.family: "Verdana"
        }

        // Поле ввода
        Rectangle {
            id: inputWrapper
            width: parent.width
            height: 137
            color: "transparent"
            radius: 18
            border.color: textInput.activeFocus ? "#6A5ACD" : "gray"
            border.width: 2

            TextInput {
                id: textInput
                anchors.fill: parent
                anchors.margins: 15
                color: "#ffffff"
                font.pixelSize: 50
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLength: 18
                passwordCharacter: "#"
                mouseSelectionMode: TextInput.SelectCharacters
                font.bold: true
                font.family: "Verdana"
                font.weight: Font.DemiBold
                focus: true

                onTextChanged: {
                    if (errorText.text !== "") {
                        errorText.text = "";
                    }
                }

                onAccepted: {
                    loginButton.clicked();
                }
            }

            Text {
                id: placeholder
                anchors.fill: parent
                anchors.margins: 15
                text: "UserID"
                color: "#666666"
                font: textInput.font
                visible: !textInput.text && !textInput.activeFocus
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        // Текст ошибки под полем ввода
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

        // Растягивающийся элемент
        Item {
            width: parent.width
            height: parent.height - titleText.height - inputWrapper.height - errorText.height - loginButton.height - 3*parent.spacing
        }

        // Кнопка "Войти"
        Button {
            id: loginButton
            width: parent.width
            height: 80
            text: "Войти"
            font.pixelSize: 30
            font.bold: true
            font.family: "Verdana"

            background: Rectangle {
                color: parent.down ? "#4B0082" : "#6A5ACD"
                radius: 22
                opacity: parent.enabled ? 1 : 0.3
            }

            contentItem: Text {
                text: loginButton.text
                font: loginButton.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: parent.enabled ? 1 : 0.7
            }

            onClicked: {
                console.log("Нажата кнопка 'Войти'");
                console.log("Введенный текст:", textInput.text);
                
                // Проверяем, что controller существует перед вызовом
                if (typeof controller !== 'undefined') {
                    controller.handleLogin(textInput.text);
                } else {
                    console.error("Controller is not available!");
                    errorText.text = "Ошибка: контроллер не доступен";
                }
            }
        }
    }
}