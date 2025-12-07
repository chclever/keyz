import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15

Page {
    id: root
    width: 600
    height: 450

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
                Layout.fillWidth: true
                font.pixelSize: 22
                color: "white"
                background: Rectangle {
                    radius: 8
                    color: "transparent"
                    border.color: "#A020F0"
                    border.width: 2
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
                Layout.fillWidth: true
                font.pixelSize: 22
                color: "white"
                background: Rectangle {
                    radius: 8
                    color: "transparent"
                    border.color: "#A020F0"
                    border.width: 2
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
                echoMode: TextInput.Password
                Layout.fillWidth: true
                font.pixelSize: 22
                color: "white"
                background: Rectangle {
                    radius: 8
                    color: "transparent"
                    border.color: "#A020F0"
                    border.width: 2
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
                    onClicked: console.log("Назад")
                }
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
                    onClicked: console.log("Сохранено")
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
