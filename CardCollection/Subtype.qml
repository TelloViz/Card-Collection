import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects
import QtQuick3D


Rectangle {
    id: root

    // Exposed properties

    property alias text: blockText.text

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


    width: 122
    height: 51
    color: blockBG
    radius: 6
    border.color: blockBorderColor
    border.width: 2

    Rectangle {
        id: blockBezel
        visible: true
        color: bezelColor
        radius: 8
        border.color: bezelBorderColor
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        Layout.preferredHeight: 60
        Layout.preferredWidth: 60
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            id: blockScreen
            x: 7
            y: 4
            color: screenColor
            radius: 4
            border.color: screenShadeColor
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 6
            anchors.rightMargin: 6
            anchors.topMargin: 6
            anchors.bottomMargin: 6
            Text {
                id: blockText
                color: dropTextColor
                text: "Sub Type 1"
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                state: "base state4"
                z: 0
                minimumPointSize: 4
                minimumPixelSize: 4
                fontSizeMode: Text.Fit
                font.styleName: "ExtraBold Italic"
                font.pointSize: 20
            }

            Text {
                id: blockDropText
                visible: true
                color: dropTextColor
                text: blockText.text
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                font.styleName: blockText.font.styleName
                font.pointSize: blockText.font.pointSize
                z: 0
                minimumPointSize: 6
                minimumPixelSize: 6
                fontSizeMode: Text.Fit
            }

            Rectangle {
                id: blockHightlight
                x: -8
                y: -4
                color: "#00ffffff"
                radius: 4
                border.color: screenHighlightColor
                border.width: 1
                anchors.fill: parent
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
            }
            clip: true
        }
    }

    Item {
        id: __materialLibrary__
    }

}
