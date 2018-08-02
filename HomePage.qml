import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: appWindow
    visible: true
    width: Screen.width
    height: Screen.height
    style: ApplicationWindowStyle {
        background: BorderImage {
                source: "images/sea-view.jpg"
                border { left: 20; top: 20; right: 20; bottom: 20 }
            }
    }

    title: qsTr("Application Page");

    //StackView is also Inherited FRom Item Type so it can have width and height properties
    StackView {
        id: applicationStack
        initialItem: welcomePage
        width: parent.width
        height: parent.height

        Component {
            id: welcomePage

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
                 id: registerButton
                 anchors.top: welcomeDescription.bottom
                 anchors.topMargin: (Screen.height)*0.1
                 anchors.horizontalCenter: welcomePageContent.horizontalCenter
                 text: "<b>Register</b>"
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
                    registerWithFacebook.onRegisterWithFbClicked();
                }
              }
              Connections {
                 target: applicationData
                 onShowMessageToRegister: load("qrc:/PopUp.qml");
              }
          }
        }
     }
}
