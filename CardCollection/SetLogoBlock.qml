import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects


Rectangle {
    id: setLogoBlock

    // Define color scheme properties
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"
    property color dropBorderColor: "#25fb2e"

    property alias logoSource: setLogoImage.source
    property alias logoScreenText: setLogoText.text

    Rectangle {
        id: setLogoBezel
        color: bezelColor
        radius: 8
        border.color: "#616161"
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 6
        anchors.rightMargin: 6
        anchors.topMargin: 6
        anchors.bottomMargin: 6
        state: "base state4"

        Rectangle {
            id: setLogoScreen
            x: 8
            y: -1
            color: screenColor
            radius: 6
            border.color: "#095f0c"
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.topMargin: 6
            anchors.bottomMargin: 6
            clip: true

            Text {
                id: setLogoText
                color: dropTextColor
                text: (selectedIndex >= 0
                       && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                        : "Set Logo"
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.8
                wrapMode: Text.Wrap
                font.family: "Ubuntu Sans"
                z: 1
                font.styleName: "ExtraBold Italic"
                font.italic: false
                font.bold: false
                font.pointSize: 32
                fontSizeMode: Text.Fit
            }

            // // Apply a DropShadow effect to the image
            // DropShadow {
            //     anchors.fill: setLogoText
            //     source: setLogoText // The image to which we are applying the shadow
            //     horizontalOffset: 5 // Adjust X-axis shadow offset
            //     verticalOffset: 5 // Adjust Y-axis shadow offset
            //     radius: 3.8 // Blur effect, adjust for smoothness
            //     samples: 16 // Higher value for smoother shadows
            //     color: "#095f0c" // Color of the shadow
            //     opacity: 0.8 // Transparency of the shadow
            // }

            Image {
                id: setLogoImage
                anchors.verticalCenter: setLogoText.verticalCenter
                anchors.right: parent.right
                anchors.fill: parent
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                anchors.topMargin: 6
                anchors.bottomMargin: 6
                source: (selectedIndex >= 0
                         && selectedIndex < cards.length) ? cards[selectedIndex].setLogo : ""
                z: 1

                scale: 1
                fillMode: Image.PreserveAspectFit
            }
            // Apply a DropShadow effect to the image
            DropShadow {
                anchors.fill: setLogoImage
                source: setLogoImage // The image to which we are applying the shadow
                horizontalOffset: 5 // Adjust X-axis shadow offset
                verticalOffset: 5 // Adjust Y-axis shadow offset
                radius: 3.8 // Blur effect, adjust for smoothness
                samples: 16 // Higher value for smoother shadows
                color: textColor // Color of the shadow
                opacity: 0.8 // Transparency of the shadow
            }

            Text {
                id: setLogoDropText
                x: 1
                y: 2
                visible: false
                color: textColor
                text: (selectedIndex >= 0
                       && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                        : "Set Logo"
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: -4
                anchors.topMargin: 4
                anchors.bottomMargin: -4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                lineHeight: 0.8
                wrapMode: Text.Wrap
                z: 0
                fontSizeMode: Text.Fit
                font.styleName: "ExtraBold Italic"
                font.pointSize: 32
                font.italic: false
                font.family: "Ubuntu Sans"
                font.bold: false
            }

            Rectangle {
                id: screenHightlight
                x: -13
                y: -9
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
        }
    }

    Item {
        id: __materialLibrary__
    }
}
