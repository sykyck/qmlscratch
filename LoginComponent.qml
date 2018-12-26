import QtQuick 2.0
import QtQuick.Layouts 1.11
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.4
import "./src/styles"
import "./src/content"

Item {
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    Material.background: Material.Dark
    id:loginPageContent

 ColumnLayout {

     anchors.horizontalCenter: parent.horizontalCenter

      RowLayout {
         id:loginDescriptionRow
         Layout.topMargin: (Screen.height)*0.1
         Layout.alignment: Qt.AlignCenter

         TextContent {
           id: loginDescription
           horizontalAlignment: Text.AlignHCenter
           text: "<b>Enter Login Details</b>"
          }

       }

       RowLayout {
          id:emailRow
          Layout.topMargin: (Screen.height)*0.05
          Layout.alignment: Qt.AlignCenter

          TextContent {
            id: emailFieldDescription
            horizontalAlignment: Text.AlignHCenter
            text: "<b>Email</b>"
          }

          TextField {
             id: emailTextField
             Layout.minimumWidth: (Screen.width)*0.3
             height: 30
           }
        }

        RowLayout {

            id:passwordRow
            Layout.topMargin: (Screen.height)*0.05
            Layout.alignment: Qt.AlignCenter

           TextContent {
              id: passwordFieldDescription
              horizontalAlignment: Text.AlignHCenter
              text: "<b>Password</b>"
            }

            TextField {
              id: passwordTextField
              Layout.minimumWidth: (Screen.width)*0.3
              height: 30
            }
        }


       RowLayout {

           id:buttonRow
           Layout.topMargin: (Screen.height)*0.05
           Layout.alignment: Qt.AlignCenter

           Button {
              id:submitFormButton
              Layout.minimumWidth:(Screen.width)*0.2
              style:BigButtonStyle{}
              text:"Submit"
              onClicked: {
                 registerAndLogin.onLoginButtonClicked(emailTextField.text, passwordTextField.text);
             }
           }

           Button {
              id:registerButton
              Layout.minimumWidth:(Screen.width)*0.2
              style:BigButtonStyle{}
              text:"Register"
              onClicked: {
                loginPageContent.parent.setSource("qrc:///WelcomeComponent.qml")
             }
           }
       }
 }

}
