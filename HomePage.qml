import QtQuick 2.11
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
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
