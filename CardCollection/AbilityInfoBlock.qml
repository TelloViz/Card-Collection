// AttackInfoBlock.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects

/*
https://images.pokemontcg.io/sm1/162_hires.png
https://images.pokemontcg.io/sm1/163_hires.png
https://images.pokemontcg.io/sm1/164_hires.png
https://images.pokemontcg.io/sm1/165_hires.png
https://images.pokemontcg.io/sm1/166_hires.png
https://images.pokemontcg.io/sm1/167_hires.png
https://images.pokemontcg.io/sm1/168_hires.png
https://images.pokemontcg.io/sm1/169_hires.png
https://images.pokemontcg.io/sm1/170_hires.png
https://images.pokemontcg.io/sm1/171_hires.png
https://images.pokemontcg.io/sm1/172_hires.png
*/

Rectangle {
    id: root
    property alias nameText: nameText.text
    property alias typeText: abilityTypeText.text
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
    width: 300 // Default value, can be overridden
    height: 197
    color: blockBG
    radius: 6
    border.color: "#6c0101"
    border.width: 2 // Default value, can be overridden


    Rectangle {
        id: abilityNameBlock
        height: 40
        color: mainColor
        radius: 8
        border.color: borderColor
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 4
        // Fill the parent rectangle

        Rectangle {
            id: abilityNameBezel
            color: bezelColor
            radius: 8
            border.color: bezelBorderColor
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.rightMargin: 2
            anchors.topMargin: 2
            anchors.bottomMargin: 2

            Rectangle {
                id: abilityNameScreen
                color: screenColor
                radius: 4
                border.color: screenShadeColor
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4

                Text {
                    id: nameText
                    color: textColor
                    text: "Ability Name"
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    fontSizeMode: Text.HorizontalFit
                    font.styleName: "ExtraBold Italic"

                    onTextChanged: {
                        nameDropText.text = nameText.text
                    }
                }

                Text {
                    id: nameDropText
                    color: dropTextColor
                    text: nameText.text
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    font.pointSize: nameText.font.pointSize
                    minimumPointSize: 10
                    minimumPixelSize: 10
                    fontSizeMode: Text.HorizontalFit
                    font.styleName: "ExtraBold Italic"

                }

                Rectangle {
                    id: screenHighlight
                    color: "#00ffffff"
                    radius: 4
                    border.color: dropBorderColor
                    border.width: 1
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 3
                    anchors.topMargin: 3
                    anchors.bottomMargin: 3
                }
            }
        }
    }

    Rectangle {
        id: abilityTypeBlock
        height: 40
        color: "#00c80d0d"
        radius: 6
        border.color: "#006c0101"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: abilityNameBlock.bottom
        anchors.leftMargin: 60
        anchors.rightMargin: 60
        anchors.topMargin: 4

        Rectangle {
            id: abilityTypeBezel
            x: -22
            color: bezelColor
            radius: 8
            border.color: bezelBorderColor
            border.width: 2
            anchors.fill: parent
            Rectangle {
                id: abilityTypeScreen
                color: screenColor
                radius: 4
                border.color: screenShadeColor
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                Text {
                    id: abilityTypeText
                    color: textColor
                    text: "Ability Type"
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    onTextChanged: {
                        abilityTypeDropText.text = abilityTypeText.text
                    }
                    fontSizeMode: Text.HorizontalFit
                    font.styleName: "ExtraBold Italic"
                }

                Text {
                    id: abilityTypeDropText
                    color: dropTextColor
                    text: abilityTypeText.text
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    minimumPointSize: 10
                    minimumPixelSize: 10
                    fontSizeMode: Text.HorizontalFit
                    font.styleName: "ExtraBold Italic"
                    font.pointSize: abilityTypeText.font.pointSize
                }

                Rectangle {
                    id: abilityScreenHighlight
                    color: "#00ffffff"
                    radius: 4
                    border.color: dropBorderColor
                    border.width: 1
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 3
                    anchors.topMargin: 3
                    anchors.bottomMargin: 3
                }
            }
        }
    }

    Rectangle {
        id: descriptionBlock
        color: mainColor
        radius: 8
        border.color: borderColor
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: abilityTypeBlock.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 4
        anchors.bottomMargin: 4

        Rectangle {
            id: descriptionTextBezel
            color: bezelColor
            radius: 8
            border.color: bezelBorderColor
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.rightMargin: 2
            anchors.topMargin: 2
            anchors.bottomMargin: 2

            Rectangle {
                id: textScreen
                color: screenColor
                radius: 6
                border.color: screenHighlightColor
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
                    text: "Ability Description"
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
                    id: descriptionScreenShadeBorder
                    color: "#00ffffff"
                    radius: 4
                    border.color: screenShadeColor
                    border.width: 1
                    anchors.fill: parent
                }
            }
        }
    }



    Item {
        id: __materialLibrary__
    }


}
