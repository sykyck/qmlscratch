import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.4
import "./src/styles"

Item {
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    Material.background: Material.Dark
    id:loginPageContent

    Text {
      id: loginDescription
      horizontalAlignment: Text.AlignHCenter
      anchors.top: loginPageContent.top
      anchors.topMargin: (Screen.height)*0.1
      anchors.horizontalCenter: loginPageContent.horizontalCenter
      fontSizeMode: Text.Fit
      font.family: "Arial"
      color:"#DAF7A6"
      text: "<i>Please Enter Login Details.</i>"
     }

    TextField {
        id: emailTextField
        width: 240
        horizontalAlignment: Text.AlignHCenter
        anchors.top: loginDescription.top
        anchors.topMargin: (Screen.height)*0.1
        anchors.horizontalCenter: loginPageContent.horizontalCenter
    }

    TextField {
        id: passwordTextField
        width: 240
        horizontalAlignment: Text.AlignHCenter
        anchors.top: emailTextField.top
        anchors.topMargin: (Screen.height)*0.1
        anchors.horizontalCenter: loginPageContent.horizontalCenter
        style:TextFieldStyle{
             background: Rectangle {
                   implicitWidth: 0.4*(Screen.width)
                   implicitHeight: 40
                   border.width: control.activeFocus ? 2 : 1
                   border.color: "#888"
                   radius: 4
                   gradient: Gradient {
                       GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                       GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                   }
             }
        }
    }
}
