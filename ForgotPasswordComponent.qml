import QtQuick 2.0
import QtQuick.Layouts 1.11
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.4
import "./src/styles"
import "./src/content"

Item {
    id:loginPageContent

 ColumnLayout {

     anchors.horizontalCenter: parent.horizontalCenter

     TextContent {
       id: loginDescription
       Layout.topMargin: (Screen.height)*0.1
       Layout.alignment: Qt.AlignCenter
       Layout.maximumWidth: (Screen.width)*0.9
       horizontalAlignment: Text.AlignHCenter
       text: "<b>Enter Your Email! Password will be sent to it</b>"
      }


      TextField {
         id: emailTextField
         Layout.topMargin: (Screen.height)*0.05
         Layout.alignment: Qt.AlignCenter
         Layout.minimumWidth: (Screen.width)*0.6
         Layout.maximumWidth: (Screen.width)*0.6
         Layout.minimumHeight: (Screen.height)*0.05
         Layout.maximumHeight: (Screen.height)*0.05
         placeholderText: "Email"
         style:LoginTextFieldStyle{}

       }

      Button {
         id:resetPasswordButton
         Layout.minimumWidth:(Screen.width)*0.6
         Layout.maximumWidth:(Screen.width)*0.6
         Layout.minimumHeight: (Screen.height)*0.05
         Layout.maximumHeight: (Screen.height)*0.05
         style:BigButtonStyle{}
         text:"Forgot Password ?"
         onClicked: {
           loginPageContent.parent.setSource("qrc:///LoginComponent.qml")
        }
      }
 }

}
