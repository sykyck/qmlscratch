import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import "./src/buttons"
import "./src/content"
import "./src/styles"

Item {
      Material.theme: Material.Dark
      Material.accent: Material.Purple
      Material.background: Material.Dark
      id:welcomePageContent

    ColumnLayout{

          anchors.horizontalCenter: parent.horizontalCenter

          Text {
            id: welcomeDescription
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: (Screen.height)*0.1
            horizontalAlignment: Text.AlignHCenter
            fontSizeMode: Text.Fit
            font.family: "Arial"
            color:"#DAF7A6"
            text: "<b>Welcome To Our App!</b><br><b>Please Choose Any Of the Options For Registration.</b>"
         }


          Button {
             id: fbRegisterButton
             Layout.topMargin: (Screen.height)*0.1
             Layout.alignment: Qt.AlignCenter
             Layout.minimumWidth: 0.4*(Screen.width)
             text: "<b>Register With Facebook</b>"
             activeFocusOnPress: true
             height: 40
             style: BigButtonStyle{}
             onClicked: {
              registerAndLogin.onRegisterWithFbClicked();
            }
          }


          Button {
             id: googleRegisterButton
             Layout.topMargin: (Screen.height)*0.1
             Layout.alignment: Qt.AlignCenter
             Layout.minimumWidth: 0.4*(Screen.width)
             text: "<b>Register With Google</b>"
             activeFocusOnPress: true
             height: 40
             style: BigButtonStyle{}
             onClicked: {
                registerAndLogin.onRegisterWithGoogleClicked();
             }
          }


          Button {
             id: registerButton
             Layout.topMargin: (Screen.height)*0.1
             Layout.alignment: Qt.AlignCenter
             Layout.minimumWidth: 0.4*(Screen.width)
             text: "<b>Register With Us</b>"
             activeFocusOnPress: true
             height: 40
             style: BigButtonStyle{}
             onClicked: {
                welcomePageContent.parent.setSource("qrc:///RegisterComponent.qml")
             }
          }
    }
}
