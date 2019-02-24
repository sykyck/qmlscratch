import QtQuick 2.11
import QtQuick.Layouts 1.11
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

ApplicationWindow {
    id: appWindow
    visible: true
    width: Screen.width
    height: Screen.height
    color:"#000"
    title: qsTr("Application Page");
    header:ToolBar {

        Material.background: Material.color(Material.Grey)
        id:appWindowToolbar
        height: Screen.height*0.06

        RowLayout{

           id:toolbarLayout
           anchors.fill: parent


           ToolButton{
              id:menubutton
              Layout.fillHeight: parent
              Image{
                anchors.fill:parent
                fillMode: Image.PreserveAspectFit
                source:"qrc:///images/menu.gif"
              }
              onClicked:function(){
                  sidebarMenu.open();
              }
           }
        }
    }

    ListModel {
       id:menuModel
    }

    Drawer {
       id:sidebarMenu
       y: 0
       Material.background: Material.Grey
       width: if(Q_OS_MOBILE) {
         appWindow.width * 0.7
       } else if(Q_OS_DESKTOP){
         appWindow.width * 0.2
       }
       height: appWindow.height
       onOpened: {
           menuModel.clear();
           for(var i = 0;i<menu_items.length;i++){
                menuModel.append({"name":menu_items[i]});
             }
           }
       ListView {
           width: sidebarMenu.width
           height: sidebarMenu.height
           model:menuModel
           clip: true
           delegate: Item {
               width: sidebarMenu.width
               height: sidebarMenu.height*0.1
               Button {
                   width: parent.width
                   height: parent.height
                   hoverEnabled: true
                   text: '<b>'+name+'</b>'
                   font.family: "Neue Helvetica"
                   font.pointSize: 13
                   onClicked: {
                      if(name=="Account")
                      {

                          sidebarMenu.close();
                          pageLoader.setSource("qrc:///ProfilePageComponent.qml");
                      }
                   }
               }
           }
       }
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
