import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.4
import "./src/content"
import "./src/styles"

Item {
 id :registerComponent
 Material.theme: Material.Dark
 Material.accent: Material.Purple
 Material.background: Material.Dark

 ColumnLayout{

     anchors.horizontalCenter: parent.horizontalCenter

     TextContent {
        id: registerDescription
        Layout.topMargin: (Screen.height)*0.1
        Layout.alignment: Qt.AlignCenter
        Layout.maximumWidth: (Screen.width)*0.9
        horizontalAlignment: Text.AlignHCenter
        text: "<b>Please Enter Details For Registration</b>"
      }

     RowLayout {

             id:nameRow
             Layout.topMargin: (Screen.height)*0.05
             Layout.alignment: Qt.AlignCenter

             TextField {
                 id: nameTextField
                 style:LoginTextFieldStyle{}
                 placeholderText: "Name"
                 Layout.minimumWidth: (Screen.width)*0.6
                 Layout.maximumWidth: (Screen.width)*0.6
                 Layout.minimumHeight: (Screen.height)*0.05
                 Layout.maximumHeight: (Screen.height)*0.05
             }
     }

    RowLayout {

         id:emailRow
         Layout.topMargin: (Screen.height)*0.05
         Layout.alignment: Qt.AlignCenter

         TextField {
             id: emailTextField
             style:LoginTextFieldStyle{}
             placeholderText: "Email"
             Layout.minimumWidth: (Screen.width)*0.6
             Layout.maximumWidth: (Screen.width)*0.6
             Layout.minimumHeight: (Screen.height)*0.05
             Layout.maximumHeight: (Screen.height)*0.05
          }
    }


     RowLayout {

             id:passwordRow
             Layout.topMargin: (Screen.height)*0.05
             Layout.alignment: Qt.AlignCenter

             TextField {
                 id: passwordTextField
                 style:LoginTextFieldStyle{}
                 placeholderText: "Password"
                 Layout.minimumWidth: (Screen.width)*0.6
                 Layout.maximumWidth: (Screen.width)*0.6
                 Layout.minimumHeight: (Screen.height)*0.05
                 Layout.maximumHeight: (Screen.height)*0.05
             }
     }


     RowLayout {

             id:genderRow
             Layout.topMargin: (Screen.height)*0.05
             Layout.alignment: Qt.AlignCenter

             ExclusiveGroup { id: genderOptions }

             RadioButton {
                 id: maleRadioButton
                 text: "Male"
                 Layout.minimumWidth: (Screen.width)*0.3
                 Layout.maximumWidth: (Screen.width)*0.3
                 exclusiveGroup: genderOptions
                 style:RadioButtonStyle{}
             }
             RadioButton {
                 id: femaleRadioButton
                 text: "Female"
                 Layout.minimumWidth: (Screen.width)*0.3
                 Layout.maximumWidth: (Screen.width)*0.3
                 exclusiveGroup: genderOptions
                 style:RadioButtonStyle{}
             }
        }

     RowLayout {

         Layout.topMargin: (Screen.height)*0.05
         Layout.alignment: Qt.AlignCenter

         Button {
            id:submitFormButton
            text:"Submit"
            Layout.minimumWidth: (Screen.width)*0.3
            Layout.maximumWidth: (Screen.width)*0.3
            Layout.minimumHeight: (Screen.height)*0.05
            Layout.maximumHeight: (Screen.height)*0.05
            style:BigButtonStyle{}
            onClicked: {
               registerAndLogin.onLoginButtonClicked(emailTextField.text, passwordTextField.text);
           }
         }

         Button {
            id:loginButton
            text:"Login"
            Layout.minimumWidth: (Screen.width)*0.3
            Layout.maximumWidth: (Screen.width)*0.3
            Layout.minimumHeight: (Screen.height)*0.05
            Layout.maximumHeight: (Screen.height)*0.05
            style:BigButtonStyle{}
            onClicked: {
               registerComponent.parent.setSource("qrc:///LoginComponent.qml")
           }
         }
     }


    }
}
