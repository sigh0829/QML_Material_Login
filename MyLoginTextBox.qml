import QtQuick 2.5
import QtQuick.Layouts 1.2
import Material 0.2
import Material.ListItems 0.1 as ListItem
import Material.Extras 0.1

Item {
    id: root
    property string placeholder: "ID"
    property bool passwordMaskEnabled: false
    property string passwordMask: "*"
    

    //ListItem.Standard {
        /*action: Icon {
            anchors.centerIn: parent
            name: "action/account_circle"
        }*/

        //content: TextField {
        TextField {
            id: textBox
            anchors.centerIn: parent
            width: parent.width

            placeholderText: placeholder
            floatingLabel: true
            echoMode: passwordMaskEnabled ? TextInput.Password : TextInput.Normal
            //text: p_name
            onAccepted: {
                if (textBox.text === "password") {
                    textBox.helperText = "验证成功"
                    textBox.hasError = true
                }
            }
        }
    //}

}
