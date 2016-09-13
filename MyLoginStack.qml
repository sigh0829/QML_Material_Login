import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Window 2.1
import Material 0.2
import Material.ListItems 0.1 as ListItem

Window {
    id: rootWindow

    color: "lightgray";
    visible: true;  
    width: 640;  
    height: 320;  
    minimumWidth: 640;  
    minimumHeight: 320; 
    property var currentExample: null;
    property bool usertype: true

    ListItem.Subheader {
        text: usertype ? "治疗师身份登录" : "医师身份登录"
    }

    Rectangle {
        id: rootItem
        width: parent.width * 0.7
        height: parent.height * 0.7
        anchors.centerIn: parent

        MyLoginTextBox {
            id: textBoxID
            width: parent.width / 3
            anchors {
                top: parent.top
                topMargin: parent.height / 3
                horizontalCenter: parent.horizontalCenter
            }
            placeholder: qsTr("ID")
            Keys.onReturnPressed: {
                textBoxPass.forceActiveFocus(Qt.MouseFocusReason);
            }
        }

        MyLoginTextBox {
            id: textBoxPass
            width: textBoxID.width
            //z: 1
            anchors {
                top: textBoxID.bottom
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            //opacity: 0.3
            placeholder: qsTr("PASS")
            passwordMaskEnabled: true
            Keys.onReturnPressed: {
                console.info("Keys.onReturnPressed");
                loginBtn.forceActiveFocus(Qt.MouseFocusReason);
                loginBtn.enabled = true;
            }

            Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
            Behavior on anchors.leftMargin { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
        }

        Button {
            id: loginBtn
            text: "登录"
            elevation: 1
            enabled: false
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: textBoxPass.bottom
                topMargin: 50
            }
            onClicked: {
                var comp = Qt.createComponent("Rect2.qml");  
                if(comp.status == Component.Ready){
                    //loginBtn.background = "green";
                    rootWindow.currentExample = comp.createObject(rootWindow,{"color" : rootWindow.color});  
                    rootWindow.currentExample.back.connect(rootWindow.closeCurrentExample);
                    //这里的back 指的是子界面的“”“返回”按键
                }
                else {
                    console.info("no log:", comp.status)
                    console.info("err:",Component.Error, comp.errorString());
                }

            }
        }


    //     LoginMessage {
            // id: loginMessage
            // width: textBoxID.width
            // height: root.height
            // z: 0
            // anchors {
                // left: textBoxPass.right
                // //leftMargin: -width * 0.9
                // top: parent.top
            // }
            // opacity: 0.3
            // fontColor: "#BA68C8"
            // font.pixelSize: height * 0.4

            // Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
            // Behavior on anchors.leftMargin { NumberAnimation { duration: 500; easing.type: Easing.OutQuart } }
        // }

    }

    ActionButton {
        anchors {
            right: parent.right
            top: parent.top
            margins: 64 //dp(32)
        }

        action: Action {
            id: addContent
            text: "&Switch"
            shortcut: "Ctrl+C"
            onTriggered: { 
                usertype ? usertype = false : usertype = true;
                console.info("triggle", usertype);
            }
        }
        iconName: "content/add"
    }

    function closeCurrentExample() {  
        currentExample.destroy();  
    }


}
