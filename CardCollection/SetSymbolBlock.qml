import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects
import QtQuick3D


Rectangle {
    id: root

    color: blockBG
    radius: 8
    border.color: borderColor
    border.width: 1

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

    property alias imageSource: setSymbolImage.source
    property alias blockText: setSymbolText.text
    width: 100
    height: 100

    Rectangle {
        id: setSymbolBezel
        color: bezelColor
        radius: 8
        border.color: bezelBorderColor
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 3
        anchors.bottomMargin: 3

        Rectangle {
            id: setSymbolScreen
            color: screenColor
            radius: 8
            border.color: screenShadeColor
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            clip: true

            Image {
                id: setSymbolImage
                anchors.fill: parent
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                anchors.topMargin: 6
                anchors.bottomMargin: 6

                source: (selectedIndex >= 0
                         && selectedIndex < cards.length) ? cards[selectedIndex].setSymbol : ""

                z: 1
                fillMode: Image.PreserveAspectFit
            }
            // Apply a DropShadow effect to the image
            DropShadow {
                anchors.fill: setSymbolImage
                source: setSymbolImage // The image to which we are applying the shadow
                horizontalOffset: 5 // Adjust X-axis shadow offset
                verticalOffset: 5 // Adjust Y-axis shadow offset
                radius: 3.8 // Blur effect, adjust for smoothness
                samples: 16 // Higher value for smoother shadows
                color: textColor // Color of the shadow
                opacity: 0.8 // Transparency of the shadow
            }

            Text {
                id: setSymbolText
                color: dropTextColor
                text: (selectedIndex >= 0
                       && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                        : "Set Symbol"
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                minimumPointSize: 6
                minimumPixelSize: 6
                z: 1
                font.pointSize: 10
                font.styleName: "ExtraBold Italic"
                fontSizeMode: Text.Fit
            }

            // Apply a DropShadow effect to the image
            DropShadow {
                anchors.fill: setSymbolText
                source: setSymbolText // The image to which we are applying the shadow
                horizontalOffset: 3 // Adjust X-axis shadow offset
                verticalOffset: 3 // Adjust Y-axis shadow offset
                radius: 3.8 // Blur effect, adjust for smoothness
                samples: 16 // Higher value for smoother shadows
                color: textColor // Color of the shadow
                opacity: 0.8 // Transparency of the shadow
            }

            Text {
                id: setSymbolDropText
                color: textColor
                text: setSymbolText.text
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                minimumPointSize: 6
                minimumPixelSize: 6
                z: 0
                fontSizeMode: Text.Fit
                font.styleName: "ExtraBold Italic"
                font.pointSize: 10
            }

            Rectangle {
                id: rectangle27
                x: -5
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
        }
    }

    Item {
        id: __materialLibrary__
    }
}
