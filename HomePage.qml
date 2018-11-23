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

        Loader { source: "qrc:///WelcomeComponent.qml"
                 x:parent.width/2
        }
     }
}
