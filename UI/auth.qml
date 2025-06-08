import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

Window {
    id: window
    width: 800
    height: 500
    visible: true
    color: "#000000"
    title: qsTr("AuthMenu | KeyzBeta")

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
            height: 112
            color: "transparent"
            radius: 18
            border.color: "gray"
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
            }

            Text {
                id: placeholder
                anchors.fill: parent
                anchors.margins: 15
                text: "UserID"
                color: "#ffffff"
                font: textInput.font
                visible: !textInput.text && !textInput.activeFocus
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        // Растягивающийся элемент
        Item {
            width: parent.width
            height: parent.height - titleText.height - inputWrapper.height - loginButton.height - 2*parent.spacing
        }

        // Кнопка "Войти" с новыми цветами
        Button {
            id: loginButton
            width: parent.width
            height: 80
            text: "Войти"
            font.pixelSize: 30
            font.bold: true
            font.family: "Verdana"

            background: Rectangle {
                color: parent.down ? "#4B0082" : "#6A5ACD"  // Индиго при нажатии, лавандовый в обычном состоянии
                radius: 22
                opacity: parent.enabled ? 1 : 0.3  // Полупрозрачная, если disabled
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
                console.log("Нажата кнопка 'Войти'")
                // Можно добавить:
                // loginButton.enabled = false // Блокировка кнопки после нажатия
                // authLogic() // Вызов функции авторизации
            }
        }
    }
}
