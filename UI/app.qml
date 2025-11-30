import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.15

Window {
    id: window
    width: 800
    height: 500
    visible: true
    color: "#000000"
    title: qsTr("KeyzBeta")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Qt.createComponent("auth.qml").createObject(stackView, {"stackView": stackView})
    }
}
