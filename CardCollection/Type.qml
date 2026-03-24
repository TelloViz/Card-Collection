// TypeBlock.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    width: 50
    height: 50
    visible: true
    color: blockBG
    radius: 8
    border.color: "#6c0101"
    border.width: 2

    // Add a property for the type
    property string type: ""

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


    // Logic to change appearance based on type
    onTypeChanged: {
        const typeMap = {
            "grass": "https://images.pokemontcg.io/sm1/164_hires.png",
            "fire": "https://images.pokemontcg.io/sm1/165_hires.png",
            "water": "https://images.pokemontcg.io/sm1/166_hires.png",
            "lightning": "https://images.pokemontcg.io/sm1/167_hires.png",
            "psychic": "https://images.pokemontcg.io/sm1/168_hires.png",
            "fighting": "https://images.pokemontcg.io/sm1/169_hires.png",
            "darkness": "https://images.pokemontcg.io/sm1/170_hires.png",
            "metal": "https://images.pokemontcg.io/sm1/171_hires.png",
            "fairy": "https://images.pokemontcg.io/sm1/172_hires.png",
            "dragon": "dragonEnergyCropped.png",
            "colorless": "colorlessEnergyCropped.png"
        };

        // Normalize type strings for image source mapping
        const normalizedType1 = type?.trim().toLowerCase() || "";

        // console.log("Type is " + normalizedType1)
        // console.log(typeMap[normalizedType1])


        // Handle images and special cases for colorless and dragon types
        if (type === "colorless")
        {
            colorlessType1DummyImage.source = typeMap[normalizedType1] || ""
            dragonType1DummyImage.source = ""
            colorlessType1DummyImage.visible = true;
            dragonType1DummyImage.visible = false;
            type1Image.visible = false;  // Hide the normal type image
        }
        else if (type === "dragon")
        {
            dragonType1DummyImage.source = typeMap[normalizedType1] || ""
            colorlessType1DummyImage.source = ""
            dragonType1DummyImage.visible = true;
            colorlessType1DummyImage.visible = false;
            type1Image.visible = false;  // Hide the normal type image
        }
        else
        {
            type1Image.source = typeMap[normalizedType1] || ""; // Use the mapped source
            colorlessType1DummyImage.source = ""
            dragonType1DummyImage.source = ""
            colorlessType1DummyImage.visible = false;  // Hide dummy images
            dragonType1DummyImage.visible = false;
            type1Image.visible = true;  // Show the normal type image
        }
        // console.log(type1Image.source)

    }

    Rectangle {
        id: type1Bezel
        visible: true
        color: "#b2b2b2"
        radius: 6
        border.color: bezelColor
        border.width: 2
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 4
        anchors.bottomMargin: 4
        z: 0

        Rectangle {
            id: type1Screen
            x: 7
            y: 4
            visible: true
            color: screenColor
            radius: 4
            border.color: "#128c17"
            border.width: 2
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.rightMargin: 2
            anchors.topMargin: 2
            anchors.bottomMargin: 2
            z: 0

            Text {
                id: type1Text
                visible: false
                color: textColor
                text: type // Use the type property here
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                z: 0
                state: "base state4"
                minimumPointSize: 4
                minimumPixelSize: 4
                fontSizeMode: Text.Fit
                font.styleName: "Bold Italic"
                font.pointSize: 30
            }

            Rectangle {
                id: type1BlockHightlight
                x: -8
                y: -4
                visible: false
                color: "#00ffffff"
                radius: 4
                border.color: "#25fb2e"
                border.width: 1
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                z: 0
                clip: true
            }

            Rectangle {
                id: type1ImageBlock
                visible: true
                color: "#00ffffff"
                radius: 10
                border.color: "#0002d20b"
                border.width: 0
                anchors.fill: parent
                scale: 0.9

                Image {
                    id: type1Image
                    x: -154
                    y: -154
                    width: 350
                    height: 350
                    opacity: 1
                    visible: true
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
                        maskSource: type1Mask
                        layer.textureSize.width: 0
                        layer.textureSize.height: 0
                        layer.enabled: true
                        enabled: true
                        clip: false
                    }
                    fillMode: Image.Pad
                    clip: false
                }

                Rectangle {
                    id: type1Mask
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

            Image {
                id: colorlessType1DummyImage
                x: -157
                y: -157
                width: 350
                height: 350
                opacity: 1
                visible: false
                source: "colorlessEnergyCropped.png"
                z: 0
                sourceSize.width: 0
                sourceSize.height: 0
                scale: 0.95
                layer.enabled: true
                layer.effect: OpacityMask {
                    width: 34
                    height: 34
                    opacity: 0
                    visible: true
                    scale: 1
                    maskSource: colorlessType1Mask
                    layer.textureSize.width: 0
                    layer.textureSize.height: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                fillMode: Image.Pad
                clip: true
            }

            Rectangle {
                id: colorlessType1Mask
                x: 0
                y: 0
                width: 36
                height: 36
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

            Image {
                id: dragonType1DummyImage
                x: -157
                y: -157
                width: 350
                height: 350
                opacity: 1
                visible: false
                source: "dragonEnergyCropped.png"
                z: 0
                sourceSize.width: 0
                sourceSize.height: 0
                scale: 0.95
                layer.enabled: true
                layer.effect: OpacityMask {
                    width: 34
                    height: 34
                    opacity: 0
                    visible: true
                    scale: 1
                    maskSource: dragonType1Mask
                    layer.textureSize.width: 0
                    layer.textureSize.height: 0
                    layer.enabled: true
                    enabled: true
                    clip: false
                }
                fillMode: Image.Pad
                clip: true
            }

            Rectangle {
                id: dragonType1Mask
                x: 0
                y: 0
                width: 36
                height: 36
                visible: false
                color: "#ffffff"
                radius: 46
                border.width: 0
                scale: 1
                layer.textureSize.width: 0
                layer.enabled: true
                enabled: true
                clip: true
            }
            clip: true
        }
        clip: true
    }

    Item {
        id: __materialLibrary__
    }
}
