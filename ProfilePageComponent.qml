import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import "./src/buttons"
import "./src/content"
import "./src/styles"

Item {
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    Material.background: Material.Dark
    id:profilePageContent

    RowLayout {
        id:columnContainingRow
        anchors.horizontalCenter: profilePageContent.horizontalCenter


        ColumnLayout{

              id: profilePageFirstColumn
              width:if(Q_OS_MOBILE) {
                        0
                    } else if(Q_OS_DESKTOP) {
                       profilePageContent.width*0.2
                    }
              ListModel {
                 id:profileMenuModel
              }

              ListView {
                  width: profilePageFirstColumn.width
                  height: profilePageFirstColumn.height
                  model:profileMenuModel
                  clip: true
                  delegate: Item {
                      width: profilePageFirstColumn.width
                      height: profilePageFirstColumn.height*0.1

                  }
              }
        }

        ColumnLayout{
              id: profilePageSecondColumn
              width:if(Q_OS_MOBILE) {
                       profilePageContent.width
                    } else if(Q_OS_DESKTOP) {
                       profilePageContent.width*0.8
                    }

              Text {
                id: welcomeDescription2
                Layout.alignment: Qt.AlignCenter
                Layout.topMargin: (Screen.height)*0.1
                Layout.maximumWidth: (Screen.width)*0.9
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                font.family: "Arial"
                color:"#DAF7A6"
                text: "<b>Welcome To Our App!</b><br><b>Please Choose Any Of the Options For Registration.</b>"
             }


              Button {
                 id: fbRegisterButton2
                 Layout.topMargin: (Screen.height)*0.1
                 Layout.alignment: Qt.AlignCenter
                 Layout.minimumWidth: 0.6*(Screen.width)
                 Layout.maximumWidth: 0.6*(Screen.width)
                 Layout.minimumHeight: (Screen.height)*0.05
                 Layout.maximumHeight: (Screen.height)*0.05
                 Layout.fillHeight: true
                 Layout.fillWidth: true
                 text: "<b>Register With Facebook</b>"
                 activeFocusOnPress: true
                 style: BigButtonStyle{}
                 onClicked: {
                  registerAndLogin.onRegisterWithFbClicked();
                }
              }


              Button {
                 id: googleRegisterButton2
                 Layout.topMargin: (Screen.height)*0.1
                 Layout.alignment: Qt.AlignCenter
                 Layout.fillHeight: true
                 Layout.fillWidth: true
                 Layout.minimumWidth: 0.6*(Screen.width)
                 Layout.maximumWidth: 0.6*(Screen.width)
                 Layout.minimumHeight: (Screen.height)*0.05
                 Layout.maximumHeight: (Screen.height)*0.05
                 text: "<b>Register With Google</b>"
                 activeFocusOnPress: true
                 style: BigButtonStyle{}
                 onClicked: {
                    registerAndLogin.onRegisterWithGoogleClicked();
                 }
              }


              Button {
                 id: registerButton2
                 Layout.topMargin: (Screen.height)*0.1
                 Layout.alignment: Qt.AlignCenter
                 Layout.minimumWidth: 0.6*(Screen.width)
                 Layout.maximumWidth: 0.6*(Screen.width)
                 Layout.minimumHeight: (Screen.height)*0.05
                 Layout.maximumHeight: (Screen.height)*0.05
                 Layout.fillHeight: true
                 Layout.fillWidth: true
                 text: "<b>Register With Us</b>"
                 activeFocusOnPress: true
                 height: (Screen.height)*0.1
                 style: BigButtonStyle{}
                 onClicked: {
                    welcomePageContent.parent.setSource("qrc:///RegisterComponent.qml")
                 }
              }
        }
    }
}
