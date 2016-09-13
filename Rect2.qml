import QtQuick 2.5
import QtQuick.Window 2.1
import QtQuick.Controls 1.3

Item {
    id:root
    anchors.fill: parent
    property var color: "red"
    signal back();

    Rectangle {
        anchors.fill: parent
        color: parent.color

        Text {
            text: "LALALALA"
        }
    }
    Button {
        id: back
        text: qsTr("返回")
        onClicked: root.back();
    }
}
