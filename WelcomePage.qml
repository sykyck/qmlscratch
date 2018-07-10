import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Application Page");

    StackView {
        id: stack
        initialItem: registration

        Component {
            id: registration

            Text {
               text: stack.depth
               anchors.centerIn: parent
            }



        }
    }
}
