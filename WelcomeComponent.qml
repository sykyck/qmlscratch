import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Item {

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
         style: ButtonStyle {
              background: Rectangle {
                    implicitWidth: 0.5*(Screen.width)
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
        onClicked: {
            register.onRegisterWithFbClicked();
        }
      }
      Button {
         id: googleRegisterButton
         anchors.top: fbRegisterButton.bottom
         anchors.topMargin: (Screen.height)*0.1
         anchors.horizontalCenter: welcomePageContent.horizontalCenter
         text: "<b>Register With Google</b>"
         activeFocusOnPress: true
         style: ButtonStyle {
              background: Rectangle {
                    implicitWidth: 0.5*(Screen.width)
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
        onClicked: {
            register.onRegisterWithGoogleClicked();
        }
      }
      Connections {
         target: applicationData
         onShowMessageToRegister: load("qrc:/PopUp.qml");
      }
}
