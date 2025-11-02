import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

Rectangle {
    id: main
    width: 800
    height: 500
    color: "#000000"

    ListView {
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        spacing: 5

        model: ListModel {
            ListElement {
                name: "Steam"
                account: "ProKiller2011"
            }
        }

        delegate: Rectangle {
            id: rectangle
                    width: parent.width     // Задайте ширину Rectangle
                    height: 60             //  Задайте высоту Rectangle
                    color: rectangle.hovered ? "#6A5ACD" : "#4B0082"
                    radius: 10
                    border.width: 0

                    Text {
                        color: "#ffffff"
                        text: name + "  | " + account
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
        }
    }
}
