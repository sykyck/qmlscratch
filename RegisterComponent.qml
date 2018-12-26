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
     anchors.centerIn: parent

     TextContent {
        id: registerDescription
        horizontalAlignment: Text.AlignHCenter
        text: "<b>Please Enter Details For Registration</b>"
      }

     RowLayout {

             id:nameRow
             Layout.topMargin: (Screen.height)*0.05

             TextContent {
                 id: nameDescription
                 horizontalAlignment: Text.AlignHCenter
                 text: "<b>Name</b>"
              }

             TextField {
                 id: nameTextField
                 Layout.minimumWidth: (Screen.width)*0.3
                 width: (Screen.width)*0.3
                 height: 30
              }
     }

    RowLayout {

         id:emailRow
         Layout.topMargin: (Screen.height)*0.05

         TextContent {
            id: emailDescription
            horizontalAlignment: Text.AlignHCenter
            text: "<b>Email</b>"
          }

         TextField {
             id: emailTextField
             Layout.minimumWidth: (Screen.width)*0.3
             width: (Screen.width)*0.3
             height: 30
          }
    }


     RowLayout {

             id:passwordRow
             Layout.topMargin: (Screen.height)*0.05

             TextContent {
                id: passwordDescription
                horizontalAlignment: Text.AlignHCenter
                text: "<b>Password</b>"
              }

             TextField {
                 id: passwordTextField
                 Layout.minimumWidth: (Screen.width)*0.3
                 width: (Screen.width)*0.3
                 height: 30
              }
     }


     RowLayout {

             id:genderRow
             Layout.topMargin: (Screen.height)*0.05

             TextContent {
                id: genderDescription
                horizontalAlignment: Text.AlignHCenter
                text: "<b>Gender</b>"
              }

             ExclusiveGroup { id: genderOptions }

             RadioButton {
                 text: "Male"
                 Layout.minimumWidth: (Screen.width)*0.1
                 exclusiveGroup: genderOptions
                 style:RadioButtonStyle{}
             }
             RadioButton {
                 text: "Female"
                 Layout.minimumWidth: (Screen.width)*0.1
                 exclusiveGroup: genderOptions
                 style:RadioButtonStyle{}
             }
        }

     RowLayout {

         Layout.topMargin: (Screen.height)*0.05

         Button {
            id:submitFormButton
            text:"Submit"
            Layout.minimumWidth: (Screen.width)*0.20
            style:BigButtonStyle{}
            onClicked: {
               registerAndLogin.onLoginButtonClicked(emailTextField.text, passwordTextField.text);
           }
         }

         Button {
            id:loginButton
            text:"Login"
            Layout.minimumWidth: (Screen.width)*0.20
            style:BigButtonStyle{}
            onClicked: {
               registerComponent.parent.setSource("qrc:///LoginComponent.qml")
           }
         }
     }


    }
}
