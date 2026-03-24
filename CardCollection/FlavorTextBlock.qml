import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects


Rectangle {
    id: root

    property alias descText: descriptionText.text
    property alias isVisible: root.visible

    // Exposed properties
    property color blockBG: "#ff0000"
    property color blockBorderColor:"#00ff0000"
    property color mainColor: "#c80d0d"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color dimScreenColor: "#1c3e1d"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"
    property color dropBorderColor: "#25fb2e"

    // Width and Height
    width: 250 // Default value, can be overridden
    height: 150
    color: blockBG
    radius: 8
    border.color: "#6c0101"
    border.width: 2 // Default value, can be overridden
    //anchors.fill: parent
   // anchors.leftMargin: 2
    //anchors.rightMargin: 2
    //anchors.topMargin: 2
    //anchors.bottomMargin: 2

    Rectangle {
        id: descriptionTextBezel
        color: bezelColor
        radius: 8
        border.color: bezelBorderColor
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 4
        anchors.bottomMargin: 4

        Rectangle {
            id: textScreen
            color: screenColor
            radius: 8
            border.color: screenShadeColor
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.topMargin: 4
            anchors.bottomMargin: 4

            Text {
                id: descriptionDropText
                visible: true
                color: dropTextColor
                text: descriptionText.text
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.pointSize: descriptionText.font.pointSize
                minimumPointSize: 6
                minimumPixelSize: 6
                z: 1
                fontSizeMode: Text.Fit
                font.styleName: "ExtraBold Italic"
            }

            Text {
                id: descriptionText
                visible: true
                color: textColor
                text: "Flavor Text"
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.pointSize: 15
                minimumPointSize: 6
                minimumPixelSize: 6
                z: 0
                fontSizeMode: Text.Fit
                font.styleName: "ExtraBold Italic"
            }

            Rectangle {
                id: highlightBorder
                color: "#00ffffff"
                radius: 8
                border.color: screenHighlightColor
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }
        }
    }
}

