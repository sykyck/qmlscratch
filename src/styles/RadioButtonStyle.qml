import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.4

RadioButtonStyle {
    background: Rectangle {
          id:radioButtonBackground
          border.width: 0
          radius: 10
          color: "#004D40"
          gradient: Gradient {
              GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
              GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
          }
       }
}

