import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.4
import "./src/buttons"
import "./src/content"
import "./src/styles"

Item {
      Material.theme: Material.Dark
      Material.accent: Material.Purple
      Material.background: Material.Dark
      id:welcomePageContent

      Text {
        id: welcomeDescription
        horizontalAlignment: Text.AlignHCenter
        anchors.top: welcomePageContent.top
        anchors.topMargin: (Screen.height)*0.1
        anchors.horizontalCenter: welcomePageContent.horizontalCenter
        fontSizeMode: Text.Fit
        font.family: "Arial"
        text: "<b>Welcome To Our App!</b><br><i>Please Choose Any Of the Options For Registration.</i>"
       }

      Button {
         id: fbRegisterButton
         anchors.top: welcomeDescription.bottom
         anchors.topMargin: (Screen.height)*0.1
         anchors.horizontalCenter: welcomePageContent.horizontalCenter
         text: "<b>Register With Facebook</b>"
         activeFocusOnPress: true
         width: 0.4*(Screen.width)
         height: 40
         onClicked: {
           register.onRegisterWithFbClicked();
           welcomePageContent.parent.setSource("qrc:///LoginComponent.qml")
         }
      }

      Button {
         id: googleRegisterButton
         anchors.top: fbRegisterButton.bottom
         anchors.topMargin: (Screen.height)*0.1
         anchors.horizontalCenter: welcomePageContent.horizontalCenter
         text: "<b>Register With Google</b>"
         activeFocusOnPress: true
         width: 0.4*(Screen.width)
         height: 40
         onClicked: {
            register.onRegisterWithGoogleClicked();
            welcomePageContent.parent.setSource("qrc:///LoginComponent.qml")
        }
      }

      Button {
         id: loginButton
         anchors.top: googleRegisterButton.bottom
         anchors.topMargin: (Screen.height)*0.1
         anchors.horizontalCenter: welcomePageContent.horizontalCenter
         text: "<b>Login</b>"
         activeFocusOnPress: true
         width: 0.4*(Screen.width)
         height: 40
         onClicked: {
            welcomePageContent.parent.setSource("qrc:///LoginComponent.qml")
        }
      }
}
