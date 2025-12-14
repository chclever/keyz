import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

Rectangle {
    id: main
    width: 800
    height: 500
    color: "#000000"

    property var userPasswords: ListModel {}
    property var stackView: null
    property string userLogin: ""

    Component.onCompleted: {
        // Подключаем сигналы контроллера
        console.log("Main page loaded for user:", userLogin);

        if (typeof controller !== 'undefined') {
            controller.sendUserData.connect(function(data) {
                console.log("[sendUserData]: data -> ", data);

                userPasswords.clear()

                data.forEach(encryptedData => {
                    userPasswords.append(encryptedData);
                })

            });
            controller.handleRenderMainDataFromUser(userLogin);

        } else {
            console.error("Controller is not defined! (on main)");
        }

    }



    ListView {
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 75
        anchors.rightMargin: 5
        anchors.topMargin: 5
        spacing: 5

        model: userPasswords

        delegate: Rectangle {
            id: rectangle
                    width: parent.width     // Задайте ширину Rectangle  //
                    height: 60             //  Задайте высоту Rectangle //
                    color: rectangle.hovered ? "#6A5ACD" : "#4B0082"
                    radius: 10
                    border.width: 0

                    Text {
                        color: "#ffffff"
                        text: login + "  | " + platform
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 14
                        anchors.rightMargin: 65
                        anchors.topMargin: 14
                        anchors.bottomMargin: 14
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.pointSize: 15
                        minimumPixelSize: 112
                        font.family: "Verdana" // Центрируйте текст в Rectangle
                    }

                    property bool hovered: false
                    HoverHandler {
                        id: hover
                        cursorShape: Qt.PointingHandCursor
                        onHoveredChanged: rectangle.hovered = hovered
                    }
                    transitions: Transition {
                        PropertyAnimation {
                            properties: "color";
                            duration: 150
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {

                            stackView.push("keyzScreen.qml", { "userid" : userLogin , "login": login, "platform": platform, "stackView" : stackView })

                            console.log(login, platform)
                        }
                    }
        }
    }

    Button {
        id: button
        width: 70
        text: qsTr("❮")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        icon.cache: false
        font.underline: false
        font.bold: false
        font.italic: false
        font.pointSize: 50
        icon.color: "#ff0000"
        
        onClicked: {
            stackView.pop("auth.qml", { "stackView" : stackView });
        }
    }

}
