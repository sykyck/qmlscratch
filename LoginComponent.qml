import QtQuick 2.0

Item {

    id:loginPageContent

    Text {
      id: loginDescription
      horizontalAlignment: Text.AlignHCenter
      anchors.top: loginPageContent.top
      anchors.topMargin: (Screen.height)*0.1
      anchors.horizontalCenter: loginPageContent.horizontalCenter
      fontSizeMode: Text.Fit
      font.family: "Arial"
      text: "<i>Please Enter Login Details.</i>"
     }

}
