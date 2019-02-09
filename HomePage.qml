import QtQuick 2.11
import QtQuick.Layouts 1.11
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

ApplicationWindow {
    id: appWindow
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    width: Screen.width
    height: Screen.height
    color: "#000000"
    title: qsTr("Application Page");
    header:ToolBar{

        id:appWindowToolbar
        height: Screen.height*0.06

        RowLayout{

           id:toolbarLayout
           anchors.fill: parent


           ToolButton{
              id:menubutton
              Layout.fillHeight: parent
              icon.source: "qrc:///images/menuicon.png"
              icon.height: parent.height
              icon.width:parent.height
              onClicked: sidebarMenu.open()
           }
        }
    }

    Drawer {
       id:sidebarMenu
       y: 0
       width: if(Q_OS_MOBILE) {
         appWindow.width * 0.7
       } else if(Q_OS_DESKTOP){
         appWindow.width * 0.2
       }

       height: appWindow.height
    }

    //StackView is also Inherited FRom Item Type so it can have width and height properties
    StackView {
        id: applicationStack
        initialItem: pageLoader
        width: parent.width
        height: parent.height

        Loader {
            id: pageLoader
            source: "qrc:///WelcomeComponent.qml"
            x:0
        }
     }
}
