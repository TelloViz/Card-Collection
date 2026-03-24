import QtQuick.Controls.Fusion 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick 2.13
import Qt5Compat.GraphicalEffects
import QtQuick3D

Rectangle {
    id: _root
    width: 600
    height: 60
    color: blockBG
    border.color: borderColor
    border.width: 0
    //anchors.left: parent.left
    //anchors.right: parent.right
    z: 0
    clip: false

    property alias blockBorderWidth: _root.border.width
    property alias toolsBorderColor: _root.border.color
    property alias toolsFillColor: _root.color
    property alias leftButtonsMargin: typesRow.anchors.left
    property alias rightButtonsMargin: typesRow.anchors.right
    property alias topButtonsMargin: typesRow.anchors.top
    property alias bottomButtonsMargin: typesRow.anchors.bottom

    property alias typesRowSpacing: typesRow.spacing


    // Exposed properties
    property color blockBG: "#ff0000"
    property color blockBorderColor:"#00ff0000"
    property color blockBorderHightlight: "#ee0000"

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
    property color transparentColor: "#00ff0000"

    // property bool grassChecked: grassTypeButton.checked
    // property bool fireChecked: fireTypeButton.checked
    // property bool waterChecked: waterTypeButton.checked
    // property bool lightningChecked: lightningTypeButton.checked
    // property bool psychicChecked: psychicTypeButton.checked
    // property bool fightingChecked: fightingTypeButton.checked
    // property bool darknessChecked: darknessTypeButton.checked
    // property bool metalChecked: metalTypeButton.checked
    // property bool colorlessChecked: colorlessTypeButton.checked
    // property bool fairyChecked: fairyTypeButton.checked
    // property bool dragonChecked: dragonTypeButton.checked

    property alias grassChecked: grassTypeButton.checked
    property alias fireChecked: fireTypeButton.checked
    property alias waterChecked: waterTypeButton.checked
    property alias lightningChecked: lightningTypeButton.checked
    property alias psychicChecked: psychicTypeButton.checked
    property alias fightingChecked: fightingTypeButton.checked
    property alias darknessChecked: darknessTypeButton.checked
    property alias metalChecked: metalTypeButton.checked
    property alias colorlessChecked: colorlessTypeButton.checked
    property alias fairyChecked: fairyTypeButton.checked
    property alias dragonChecked: dragonTypeButton.checked


    // Expose setsModel to the outside world
    property var setsModel

   // property alias toolbarContentHeight: searchFilterToolbar.contentHeight


    Rectangle {
        id: searchFilterToolbar
        color: "#00000000"
        border.color: "#00000000"
        border.width: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top



        z: 0

        Row {
            id: typesRow
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            z: 1
            Layout.leftMargin: 6
            spacing: 4
            Layout.preferredWidth: -1
            Layout.preferredHeight: -1
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.rightMargin: 6

            Component.onCompleted: {
                const typeImageMap = {
                    "grass": "https://images.pokemontcg.io/sm1/164_hires.png",
                    "fire": "https://images.pokemontcg.io/sm1/165_hires.png",
                    "water": "https://images.pokemontcg.io/sm1/166_hires.png",
                    "lightning": "https://images.pokemontcg.io/sm1/167_hires.png",
                    "psychic": "https://images.pokemontcg.io/sm1/168_hires.png",
                    "fighting": "https://images.pokemontcg.io/sm1/169_hires.png",
                    "darkness": "https://images.pokemontcg.io/sm1/170_hires.png",
                    "metal": "https://images.pokemontcg.io/sm1/171_hires.png",
                    "fairy": "https://images.pokemontcg.io/sm1/172_hires.png",
                    "dragon": "https://images.pokemontcg.io/xy6/97_hires.png",
                    "colorless": "https://images.pokemontcg.io/swsh3/176_hires.png"
                };

                // Update cost images for cost1, cost2, cost3, cost4, and cost5
                grassImage.source = typeImageMap["grass"];
                fireImage.source = typeImageMap["fire"];
                waterImage.source = typeImageMap["water"];
                lightningImage.source = typeImageMap["lightning"];
                psychicImage.source = typeImageMap["psychic"];
                fightingImage.source = typeImageMap["fighting"];
                darknessImage.source = typeImageMap["darkness"];
                metalImage.source = typeImageMap["metal"];
                fairyImage.source = typeImageMap["fairy"];
                //dragonImage.source = typeImageMap["dragon"];
                // colorlessImage.source = typeImageMap["colorless"];

                // grassTypeButton.checked = true;
                // fireTypeButton.checked = true;
                // waterTypeButton.checked = true;
                // lightningTypeButton.checked = true;
                // psychicTypeButton.checked = true;
                // fightingTypeButton.checked = true;
                // darknessTypeButton.checked = true;
                // metalTypeButton.checked = true;
                // fairyTypeButton.checked = true;
                // dragonTypeButton.checked = true;
                // colorlessTypeButton.checked = true;

                grassTypeButton.checked = false;
                fireTypeButton.checked = false;
                waterTypeButton.checked = false;
                lightningTypeButton.checked = false;
                psychicTypeButton.checked = false;
                fightingTypeButton.checked = false;
                darknessTypeButton.checked = false;
                metalTypeButton.checked = false;
                fairyTypeButton.checked = false;
                dragonTypeButton.checked = false;
                colorlessTypeButton.checked = false;

                grassDimmer.visible = !grassTypeButton.checked;
                fireDimmer.visible = !fireTypeButton.checked;
                waterDimmer.visible = !waterTypeButton.checked;
                lightningDimmer.visible = !lightningTypeButton.checked;
                psychicDimmer.visible = !psychicTypeButton.checked;
                fightingDimmer.visible = !fightingTypeButton.checked;
                darknessDimmer.visible = !darknessTypeButton.checked;
                metalDimmer.visible = !metalTypeButton.checked;
                fairyDimmer.visible = !fairyTypeButton.checked;
                dragonDummyImage.visible = !dragonTypeButton.checked;
                colorlessDummyImage.visible = !colorlessTypeButton.checked;

            }

            RoundButton {
                id: grassTypeButton
                Layout.fillWidth: false
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                checkable: true
                checked: true
                flat: false
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                highlighted: grassTypeButton.checked
                hoverEnabled: true
                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
                ToolTip.text: qsTr("Grass")
                palette {
                    button: "green"
                }
                // onClicked: {
                //    //grassDimmer.visible = !grassTypeButton.checked
                // }

                onCheckedChanged: grassDimmer.visible = !grassTypeButton.checked


                width: 50
                padding: 0

                Rectangle {
                    id: grassImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00128c17"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: grassImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/164_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: grassMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: grassDimmer
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent


                        }
                    }

                    Rectangle {
                        id: grassMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }

            }

            RoundButton {
                id: fireTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: fireTypeButton.checked
                flat: false
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "red"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Fire")

                padding: 0

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     fireDimmer.visible = !fireTypeButton.checked
                // }

                onCheckedChanged: fireDimmer.visible = !fireTypeButton.checked

                Rectangle {
                    id: fireImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: fireImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/165_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: fireMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: fireDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            border.width: 0
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: fireMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: true
                }

            }

            RoundButton {
                id: waterTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: waterTypeButton.checked
                flat: false
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "blue"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Water")

                padding: 0

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     waterDimmer.visible = !waterTypeButton.checked
                // }

                onCheckedChanged: waterDimmer.visible = !waterTypeButton.checked

                Rectangle {
                    id: waterImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: waterImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/166_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: waterMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: waterDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: waterMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: true
                }

            }

            RoundButton {
                id: lightningTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: lightningTypeButton.checked
                flat: false
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "gold"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Lightning")

                padding: 0

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     lightningDimmer.visible = !lightningTypeButton.checked
                // }

                onCheckedChanged: lightningDimmer.visible = !lightningTypeButton.checked

                Rectangle {
                    id: lightningImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: lightningImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/167_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: lightningMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: lightningDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: lightningMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }

            }

            RoundButton {
                id: psychicTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: psychicTypeButton.checked
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "darkviolet"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Psychic")

                padding: 0

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     psychicDimmer.visible = !psychicTypeButton.checked
                // }

                onCheckedChanged: psychicDimmer.visible = !psychicTypeButton.checked

                Rectangle {
                    id: psychicImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: psychicImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/168_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: psychicMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: psychicDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: psychicMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }



            }

            RoundButton {
                id: fightingTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                // highlighted: fightingTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "saddlebrown"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Fighting")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     fightingDimmer.visible = !fightingTypeButton.checked
                // }

                onCheckedChanged: fightingDimmer.visible = !fightingTypeButton.checked


                padding: 0
                Rectangle {
                    id: fightingImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: fightingImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/169_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: fightingMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: fightingDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: fightingMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }

            }

            RoundButton {
                id: darknessTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: darknessTypeButton.checked
                flat: false
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "darkslategrey"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Darkness")

                padding: 0

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     darknessDimmer.visible = !darknessTypeButton.checked
                // }

                onCheckedChanged: darknessDimmer.visible = !darknessTypeButton.checked

                Rectangle {
                    id: darknessImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: darknessImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/170_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: darknessMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: darknessDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: darknessMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }

            }

            RoundButton {
                id: metalTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: metalTypeButton.checked
                flat: false
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "lightgrey"
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Metal")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                // onClicked: {
                //     metalDimmer.visible = !metalTypeButton.checked
                // }

                onCheckedChanged: metalDimmer.visible = !metalTypeButton.checked


                padding: 0
                Rectangle {
                    id: metalImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: metalImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/171_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: metalMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: metalDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: metalMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }

            }

            RoundButton {
                id: fairyTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                clip: false
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                highlighted: fairyTypeButton.checked
                flat: false
                checked: true
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "hotpink"
                }
                hoverEnabled: true
                padding: 0

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Fairy")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
                // onClicked: {
                //     fairyDimmer.visible = !fairyTypeButton.checked
                // }

                onCheckedChanged: fairyDimmer.visible = !fairyTypeButton.checked


                Rectangle {
                    id: fairyImageBlock
                    x: -6
                    y: -6
                    visible: true
                    color: "#00ffffff"
                    radius: 10
                    border.color: "#0002d20b"
                    border.width: 0
                    anchors.fill: parent
                    scale: 0.9
                    Image {
                        id: fairyImage
                        x: -150
                        y: -150
                        width: 350
                        height: 350
                        opacity: 1
                        visible: true
                        source: "https://images.pokemontcg.io/sm1/172_hires.png"
                        sourceSize.width: 0
                        sourceSize.height: 0
                        scale: 0.15
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            width: 34
                            height: 34
                            opacity: 0
                            visible: true
                            scale: 1
                            maskSource: fairyMask
                            layer.textureSize.width: 0
                            layer.textureSize.height: 0
                            layer.enabled: true
                            enabled: true
                            clip: false
                        }
                        fillMode: Image.Pad
                        clip: false

                        Rectangle {
                            id: fairyDimmer
                            x: -10
                            y: -10
                            opacity: 1
                            color: "#83474747"
                            anchors.fill: parent
                        }
                    }

                    Rectangle {
                        id: fairyMask
                        x: 0
                        y: 0
                        width: 50
                        height: 50
                        visible: false
                        color: "#ffffff"
                        radius: 46
                        border.width: 0
                        scale: 1
                        layer.textureSize.width: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    clip: false
                }

            }

            RoundButton {
                id: dragonTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                clip: false
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                //highlighted: dragonTypeButton.checked
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "goldenrod"
                }
                // onClicked: {
                //     dragonDummyImage.visible = !dragonTypeButton.checked
                // }

                onCheckedChanged: dragonDimmer.visible = !dragonTypeButton.checked


                Image {
                    id: dragonDummyImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    z: 1
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: dragonMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    Rectangle {
                        id: dragonDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                        layer.enabled: true
                        z: 0
                    }
                    clip: false
                }

                Rectangle {
                    id: dragonMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Dragon")

                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0

                icon.source: "dragonEnergyCropped.png"
                icon.height: 50
                icon.width: 50
                padding: 0



            }

            RoundButton {
                id: colorlessTypeButton
                width: 50
                height: 50
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                z: 3
                highlighted: false
                Layout.preferredHeight: 24
                Layout.preferredWidth: 24
                Layout.rowSpan: 1
                flat: false
                checked: false
                checkable: true
                Layout.fillWidth: false
                Layout.fillHeight: false
                palette {
                    button: "white"
                }

                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Colorless")

                padding: 0
                icon.source: "colorlessEnergyCropped.png"
                icon.height: 50
                icon.width: 50
                // Change scale when hovered
                scale: hovered ? 1.2 : 1.0
                // onClicked: {
                //     colorlessDummyImage.visible = !colorlessTypeButton.checked
                // }

                onCheckedChanged: colorlessDimmer.visible = !colorlessTypeButton.checked


                Image {
                    id: colorlessDummyImage
                    x: -150
                    y: -150
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
                    z: 1
                    sourceSize.width: 0
                    sourceSize.height: 0
                    scale: 0.15
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        width: 34
                        height: 34
                        opacity: 0
                        visible: true
                        scale: 1
                        maskSource: colorlessMask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    Rectangle {
                        id: colorlessDimmer
                        x: -10
                        y: -10
                        opacity: 1
                        color: "#83474747"
                        anchors.fill: parent
                        layer.enabled: true
                        z: 0
                    }
                    clip: false
                }

                Rectangle {
                    id: colorlessMask
                    x: 0
                    y: 0
                    width: 50
                    height: 50
                    visible: false
                    color: "#ffffff"
                    radius: 46
                    border.width: 0
                    scale: 1
                    layer.textureSize.width: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }



                clip: false
            }

        }

        Item {
            id: __materialLibrary__

            PrincipledMaterial {
                id: principledMaterial
                objectName: "New Material"
            }
        }
    }

    Rectangle {
        id: rectangle8
        visible: false
        color: "#00ff0000"
        radius: 8
        border.color: blockBorderHightlight
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 3
        anchors.rightMargin: 3
        anchors.topMargin: 3
        anchors.bottomMargin: 3

        Rectangle {
            id: rectangle32
            visible: false
            color: transparentColor
            radius: 8
            border.color: blockBorderColor
            border.width: 2
            anchors.fill: parent
        }

        Rectangle {
            id: rectangle4
            width: 597
            height: 57
            visible: false
            color: transparentColor
            radius: 0
            border.color: blockBorderColor
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            z: 1
        }
    }
}
