import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.11
import "./src/buttons"
import "./src/content"
import "./src/styles"

Item {

    id:profilePageContent
    width:parent.width
    height:parent.height


    RowLayout {
        id:columnsContainerRow
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.leftMargin: 0
        Layout.bottomMargin: 0
        Layout.topMargin: 0
        Layout.rightMargin: 0

        ColumnLayout{

              id: profilePageFirstColumn
              Layout.fillWidth: true
              Layout.fillHeight: true
              Layout.leftMargin: 0
              Layout.bottomMargin: 0
              Layout.topMargin: 0
              Layout.rightMargin: 0
              Rectangle{
                  id:profilePageFirstColumnContainer
                  color:"#C0C0C0"
                  Layout.fillHeight: true
                  Layout.fillWidth: true
                  Material.background: Material.color(Material.Grey)
                  width:if(Q_OS_MOBILE) {
                            0
                        } else if(Q_OS_DESKTOP) {
                           profilePageContent.width*0.2
                        }
                  height:profilePageContent.height
                  ListModel {
                     id:profileMenuModel
                  }

                  ListView {
                      width: profilePageFirstColumn.width
                      height: profilePageFirstColumn.height
                      model:profileMenuModel
                      orientation:ListView.Vertical
                      clip: true
                      delegate: Rectangle {
                          width: profilePageFirstColumn.width
                          height: profilePageFirstColumn.height*0.1

                      }
                  }
              }
        }

        ColumnLayout{
              id: profilePageSecondColumn
              Layout.fillWidth: true
              Layout.fillHeight: true
              Layout.leftMargin: 0
              Layout.bottomMargin: 0
              Layout.topMargin: 0
              Layout.rightMargin: 0
              Rectangle{
                  color:"#000"
                  width:if(Q_OS_MOBILE) {
                           profilePageContent.width
                        } else if(Q_OS_DESKTOP) {
                           profilePageContent.width*0.8
                        }
                 height:profilePageContent.height


              }
        }
    }
}
