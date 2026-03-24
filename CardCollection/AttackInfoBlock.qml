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

    property alias cost1Visible: cost1Block.visible
    property alias cost2Visible: cost2Block.visible
    property alias cost3Visible: cost3Block.visible
    property alias cost4Visible: cost4Block.visible
    property alias cost5Visible: cost5Block.visible

    property alias cost1Width: cost1Block.width
    property alias cost1Height: cost1Block.height

    property alias cost2Width: cost2Block.width
    property alias cost2Height: cost2Block.height

    property alias cost3Width: cost3Block.width
    property alias cost3Height: cost3Block.height

    property alias cost4Width: cost4Block.width
    property alias cost4Height: cost4Block.height

    property alias cost5Width: cost5Block.width
    property alias cost5Height: cost5Block.height

    property alias cost1Text: cost1Text.text
    property alias cost2Text: cost2Text.text
    property alias cost3Text: cost3Text.text
    property alias cost4Text: cost4Text.text
    property alias cost5Text: cost5Text.text

    property alias descText: descriptionText.text

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
    height: 200
    color: blockBG
    radius: 4
    border.color: blockBorderColor
    border.width: 0 // Default value, can be overridden

    // function updateVisibilityAndWidth() {
    //     // Count visible blocks
    //     const visibleBlocks = [cost1Block, cost2Block, cost3Block, cost4Block, cost5Block]
    //     .filter(block => block.visible);

    //     const visibleCount = visibleBlocks.length;

    //     // Calculate width for each visible block with a slight reduction for spacing
    //     const margin = 5; // Margin between blocks
    //     const spacing = 3; // Current spacing in Flow
    //     const totalSpacing = spacing * (visibleCount - 1); // Total space taken by margins
    //     const proportionalWidth = visibleCount > 0 ? (costBlock.width - totalSpacing) / visibleCount : 0;

    //     // Set the width of each block based on visibility
    //     visibleBlocks.forEach(block => {
    //                               block.width = proportionalWidth > 0 ? proportionalWidth : 0; // Ensure non-negative width
    //                           });
    // }

    function updateAttack(attackName, attackText, attackIndex, costs) {
        // Set default values
        const defaultName = "Attack " + (attackIndex + 1);
        const defaultText = "No description available.";

        // Update name and description texts
        nameText.text = attackName || defaultName;
        descriptionText.text = attackText || defaultText;

        updateCostTexts(costs);

        root.visible = nameText.text !== defaultName;
    }

    function updateCostTexts(costs) {
        const defaultCost1 = "Cost 1";
        const defaultCost2 = "Cost 2";
        const defaultCost3 = "Cost 3";
        const defaultCost4 = "Cost 4";
        const defaultCost5 = "Cost 5";

        const costImageMap = {
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

        // Update cost texts for all costs
        cost1Text.text = costs.cost1 || defaultCost1;
        cost2Text.text = costs.cost2 || defaultCost2;
        cost3Text.text = costs.cost3 || defaultCost3;
        cost4Text.text = costs.cost4 || defaultCost4;
        cost5Text.text = costs.cost5 || defaultCost5;

        // Normalize costs for image source assignment
        const normalizedCost1 = costs.cost1 ? costs.cost1.trim().toLowerCase() : null;
        const normalizedCost2 = costs.cost2 ? costs.cost2.trim().toLowerCase() : null;
        const normalizedCost3 = costs.cost3 ? costs.cost3.trim().toLowerCase() : null;
        const normalizedCost4 = costs.cost4 ? costs.cost4.trim().toLowerCase() : null;
        const normalizedCost5 = costs.cost5 ? costs.cost5.trim().toLowerCase() : null;

        if(normalizedCost1 === "colorless") {
            colorless1DummyImage.visible = true;
            cost1Image.visible = false;
            dragon1DummyImage.visible = false;

        }else if(normalizedCost1 === "dragon") {
            dragon1DummyImage.visible = true;
            colorless1DummyImage.visible = false;
            cost1Image.visible = false;
        }
        else {
            cost1Image.source = costImageMap[normalizedCost1] || "";
            colorless1DummyImage.visible = false;
            dragon1DummyImage.visible = false;
            cost1Image.visible = true;
        }

        if(normalizedCost2 === "colorless") {
            colorless2DummyImage.visible = true;
            cost2Image.visible = false;
            dragon2DummyImage.visible = false;

        }else if(normalizedCost2 === "dragon") {
            dragon2DummyImage.visible = true;
            colorless2DummyImage.visible = false;
            cost2Image.visible = false;
        }
        else {
            cost2Image.source = costImageMap[normalizedCost2] || "";
            colorless2DummyImage.visible = false;
            dragon2DummyImage.visible = false;
            cost2Image.visible = true;
        }

        if(normalizedCost3 === "colorless") {
            colorless3DummyImage.visible = true;
            cost3Image.visible = false;
            dragon3DummyImage.visible = false;

        }else if(normalizedCost3 === "dragon") {
            dragon3DummyImage.visible = true;
            colorless3DummyImage.visible = false;
            cost3Image.visible = false;
        }else {
            cost3Image.source = costImageMap[normalizedCost3] || "";
            colorless3DummyImage.visible = false;
            dragon3DummyImage.visible = false;

            cost3Image.visible = true;
        }

        if(normalizedCost4 === "colorless") {
            colorless4DummyImage.visible = true;
            cost4Image.visible = false;
            dragon4DummyImage.visible = false;

        }else if(normalizedCost4 === "dragon") {
            dragon4DummyImage.visible = true;
            colorless4DummyImage.visible = false;
            cost4Image.visible = false;
        }else {
            cost4Image.source = costImageMap[normalizedCost4] || "";
            colorless4DummyImage.visible = false;
            dragon4DummyImage.visible = false;

            cost4Image.visible = true;
        }

        if(normalizedCost5 === "colorless") {
            colorless5DummyImage.visible = true;
            dragon5DummyImage.visible= false;
            cost5Image.visible = false;
        }else if(normalizedCost5 === "dragon") {
            dragon5DummyImage.visible = true;
            colorless5DummyImage.visible = false;
            cost5Image.visible = false;
        }else {
            cost5Image.source = costImageMap[normalizedCost5] || "";
            colorless5DummyImage.visible = false;
            dragon5DummyImage.visible = false;

            cost5Image.visible = true;
        }

        // console.log(" ")
        // console.log("COSTS" + selectedIndex + ":")
        // console.log(normalizedCost1)
        // console.log(normalizedCost2)
        // console.log(normalizedCost3)
        // console.log(normalizedCost4)
        // console.log(normalizedCost5)

        // // Update cost images for cost1, cost2, cost3, cost4, and cost5
        // cost1Image.source = costImageMap[normalizedCost1] || "";
        // cost2Image.source = costImageMap[normalizedCost2] || "";
        // cost3Image.source = costImageMap[normalizedCost3] || "";
        // cost4Image.source = costImageMap[normalizedCost4] || "";
        // cost5Image.source = costImageMap[normalizedCost5] || "";

        // Determine visibility based on whether costs were provided
        const cost1Visible = cost1Text.text !== defaultCost1;
        const cost2Visible = cost2Text.text !== defaultCost2;
        const cost3Visible = cost3Text.text !== defaultCost3;
        const cost4Visible = cost4Text.text !== defaultCost4;
        const cost5Visible = cost5Text.text !== defaultCost5;

        // Update visibility of cost texts
        cost1Text.visible = cost1Visible;
        cost2Text.visible = cost2Visible;
        cost3Text.visible = cost3Visible;
        cost4Text.visible = cost4Visible;
        cost5Text.visible = cost5Visible;

        // Update visibility of cost texts
        //cost1ImageBlock.visible = cost1Visible;


        //updateVisibilityAndWidth(); // Trigger width recalculation
    }


    Rectangle {
        id: attackNameBlock
        height: 40
        color: mainColor
        radius: 8
        border.color: borderColor
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2
        // Fill the parent rectangle

        Rectangle {
            id: attackNameBezel
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
                id: attackNameScreen
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
                    text: "Attack Name"
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
        id: costBlock
        height: 55
        color: "#00c80d0d"
        radius: 6
        border.color: "#006c0101"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: attackNameBlock.bottom
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2

        Row {
            id: costFlow

            property int visibleCount: 0
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.rightMargin: 2
            spacing: 8


            Rectangle {
                id: cost1Block
                width: 50
                height: 50
                visible: true
                color: mainColor
                radius: 6
                border.color: "#6c0101"
                border.width: 2

                Rectangle {
                    id: cost1Bezel
                    visible: true
                    color: "#b2b2b2"
                    radius: 8
                    border.color: bezelBorderColor
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: 2
                    anchors.rightMargin: 2
                    anchors.topMargin: 2
                    anchors.bottomMargin: 2
                    z: 0
                    clip: true
                    Layout.preferredHeight: 60
                    Layout.preferredWidth: 60
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Rectangle {
                        id: cost1Screen
                        x: 7
                        y: 4
                        visible: true
                        color: dimScreenColor
                        radius: 4
                        border.color: "#128c17"
                        border.width: 2
                        anchors.fill: parent
                        anchors.leftMargin: 4
                        anchors.rightMargin: 4
                        anchors.topMargin: 4
                        anchors.bottomMargin: 4
                        z: 0
                        Text {
                            id: cost1Text
                            visible: true
                            color: textColor
                            text: "Cost 1"
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            state: "base state4"
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                            font.pointSize: 30
                        }

                        DropShadow {
                            id: cost1DropShadow
                            opacity: 0.8
                            visible: false
                            color: "#095f0c"
                            radius: 3.8
                            anchors.fill: cost1Text
                            source: cost1Text
                            verticalOffset: 3
                            samples: 16
                            horizontalOffset: 3
                        }

                        Text {
                            id: cost1DropText
                            visible: false
                            color: dropTextColor
                            text: cost1Text.text
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            font.pointSize: cost1Text.font.pointSize
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                        }

                        Rectangle {
                            id: cost1BlockHightlight
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
                            clip: true
                            z: 4
                        }

                        // Define the circular mask



                        Rectangle {
                            id: cost1ImageBlock
                            color: "#00ffffff"
                            radius: 10
                            border.color: "#0002d20b"
                            border.width: 0
                            anchors.fill: parent
                            clip: true
                            scale: 0.9
                            Image {
                                id: cost1Image
                                x: -154
                                y: -154
                                width: 350
                                height: 350
                                opacity: 1
                                visible: true
                                // source: ""
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
                                    maskSource: cost1Mask
                                    layer.textureSize.width: 0
                                    layer.textureSize.height: 0
                                    layer.enabled: true
                                    enabled: true
                                    clip: false
                                }
                                fillMode: Image.Pad
                                clip: false

                                Rectangle {
                                    id: cost1Dimmer
                                    opacity: 1
                                    visible: false
                                    color: "#83474747"
                                    anchors.fill: parent
                                }
                            }

                            Rectangle {
                                id: cost1Mask
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
                        }

                        Image {
                            id: colorless1DummyImage
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
                                maskSource: colorless1Mask
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
                            id: colorless1Mask
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
                            id: dragon1DummyImage
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
                            scale: 1
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                width: 34
                                height: 34
                                opacity: 0
                                visible: true
                                scale: 1
                                maskSource: dragon1Mask
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
                            id: dragon1Mask
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
                        clip: true
                    }
                }

            }






            Rectangle {
                id: cost2Block
                width: 50
                height: 50
                visible: true
                color: mainColor
                radius: 6
                border.color: "#6c0101"
                border.width: 2
                Rectangle {
                    id: cost2Bezel
                    visible: true
                    color: "#b2b2b2"
                    radius: 8
                    border.color: bezelBorderColor
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: 2
                    anchors.rightMargin: 2
                    anchors.topMargin: 2
                    anchors.bottomMargin: 2
                    clip: true
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 60
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Rectangle {
                        id: cost2Screen
                        x: 7
                        y: 4
                        visible: true
                        color: dimScreenColor
                        radius: 4
                        border.color: screenShadeColor
                        border.width: 2
                        anchors.fill: parent
                        anchors.leftMargin: 4
                        anchors.rightMargin: 4
                        anchors.topMargin: 4
                        anchors.bottomMargin: 4
                        Text {
                            id: cost2Text
                            visible: true
                            color: textColor
                            text: "Cost 2"
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                            font.pointSize: 30
                        }

                        DropShadow {
                            id: cost2DropShadow
                            opacity: 0.8
                            visible: false
                            color: "#095f0c"
                            radius: 3.8
                            anchors.fill: cost2Text
                            source: cost2Text
                            verticalOffset: 3
                            samples: 16
                            horizontalOffset: 3
                        }

                        Text {
                            id: cost2DropText
                            visible: false
                            color: dropTextColor
                            text: cost2Text.text
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            font.pointSize: cost2Text.font.pointSize
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                        }

                        Rectangle {
                            id: cost2BlockHightlight
                            x: -8
                            y: -4
                            visible: false
                            color: "#00ffffff"
                            radius: 4
                            border.color: "#25fb2e"
                            border.width: 1
                            anchors.fill: parent
                            anchors.leftMargin: 3
                            anchors.rightMargin: 3
                            anchors.topMargin: 3
                            anchors.bottomMargin: 3
                            clip: true
                        }
                        Rectangle {
                            id: cost2ImageBlock
                            color: "#00ffffff"
                            radius: 10
                            border.color: "#0002d20b"
                            border.width: 0
                            anchors.fill: parent
                            clip: true
                            scale: 0.9
                            Image {
                                id: cost2Image
                                x: -154
                                y: -154
                                width: 350
                                height: 350
                                opacity: 1
                                visible: true
                                // source: ""
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
                                    maskSource: cost2Mask
                                    layer.textureSize.width: 0
                                    layer.textureSize.height: 0
                                    layer.enabled: true
                                    enabled: true
                                    clip: false
                                }
                                fillMode: Image.Pad
                                clip: false

                                Rectangle {
                                    id: cost2Dimmer
                                    opacity: 1
                                    visible: false
                                    color: "#83474747"
                                    anchors.fill: parent
                                }
                            }

                            Rectangle {
                                id: cost2Mask
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
                        }

                        Image {
                            id: colorless2DummyImage
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
                                maskSource: colorless2Mask
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
                            id: colorless2Mask
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
                            id: dragon2DummyImage
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
                            scale: 0.85
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                width: 34
                                height: 34
                                opacity: 0
                                visible: true
                                scale: 1
                                maskSource: dragon2Mask
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
                            id: dragon2Mask
                            x: 0
                            y: 0
                            width: 38
                            height: 38
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
            }

            Rectangle {
                id: cost3Block
                width: 50
                height: 50
                visible: true
                color: mainColor
                radius: 6
                border.color: "#6c0101"
                border.width: 2
                Rectangle {
                    id: cost3Bezel
                    visible: true
                    color: "#b2b2b2"
                    radius: 8
                    border.color: bezelBorderColor
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: 2
                    anchors.rightMargin: 2
                    anchors.topMargin: 2
                    anchors.bottomMargin: 2
                    Rectangle {
                        id: cost3Screen
                        x: 7
                        y: 4
                        color: dimScreenColor
                        radius: 4
                        border.color: screenShadeColor
                        border.width: 2
                        anchors.fill: parent
                        anchors.leftMargin: 4
                        anchors.rightMargin: 4
                        anchors.topMargin: 4
                        anchors.bottomMargin: 4
                        Text {
                            id: cost3Text
                            visible: true
                            color: textColor
                            text: "Cost 3"
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                            font.pointSize: 30
                        }

                        DropShadow {
                            id: cost3DropShadow
                            opacity: 0.8
                            visible: false
                            color: "#095f0c"
                            radius: 3.8
                            anchors.fill: cost3Text
                            source: cost3Text
                            verticalOffset: 3
                            samples: 16
                            horizontalOffset: 3
                        }

                        Text {
                            id: cost3DropText
                            visible: false
                            color: dropTextColor
                            text: cost3Text.text

                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            font.pointSize: cost3Text.font.pointSize
                            z: 0
                            minimumPointSize: 6
                            minimumPixelSize: 6
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                        }

                        Rectangle {
                            id: cost3BlockHightlight
                            x: -8
                            y: -4
                            visible: false
                            color: "#00ffffff"
                            radius: 4
                            border.color: "#25fb2e"
                            border.width: 1
                            anchors.fill: parent
                            anchors.leftMargin: 3
                            anchors.rightMargin: 3
                            anchors.topMargin: 3
                            anchors.bottomMargin: 3
                        }

                        Rectangle {
                            id: cost3ImageBlock
                            color: "#00ffffff"
                            radius: 10
                            border.color: "#0002d20b"
                            border.width: 0
                            anchors.fill: parent
                            clip: true
                            scale: 0.9
                            Image {
                                id: cost3Image
                                x: -154
                                y: -154
                                width: 350
                                height: 350
                                opacity: 1
                                visible: true
                                // source: ""
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
                                    maskSource: cost3Mask
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
                                id: cost3Mask
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
                        }


                        Image {
                            id: colorless3DummyImage
                            x: -156
                            y: -156
                            width: 350
                            height: 350
                            opacity: 1
                            visible: false
                            source: "colorlessEnergyCropped.png"
                            z: 2
                            sourceSize.width: 0
                            sourceSize.height: 0
                            scale: 0.95
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                width: 34
                                height: 34
                                opacity: 0
                                visible: false
                                scale: 1
                                maskSource: colorless3Mask
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
                            id: colorless3Mask
                            x: 0
                            y: 0
                            width: 38
                            height: 38
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
                            id: dragon3DummyImage
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
                            scale: 0.85
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                width: 34
                                height: 34
                                opacity: 0
                                visible: false
                                scale: 1
                                maskSource: dragon3Mask
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
                            id: dragon3Mask
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

                        clip: true
                    }
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 60
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            Rectangle {
                id: cost4Block
                width: 50
                height: 50
                visible: true
                color: mainColor
                radius: 6
                border.color: "#6c0101"
                border.width: 2

                Rectangle {
                    id: cost4Bezel
                    visible: true
                    color: "#b2b2b2"
                    radius: 8
                    border.color: bezelBorderColor
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: 2
                    anchors.rightMargin: 2
                    anchors.topMargin: 2
                    anchors.bottomMargin: 2
                    Rectangle {
                        id: cost4Screen
                        x: 7
                        y: 4
                        color: dimScreenColor
                        radius: 4
                        border.color: screenShadeColor
                        border.width: 2
                        anchors.fill: parent
                        anchors.leftMargin: 4
                        anchors.rightMargin: 4
                        anchors.topMargin: 4
                        anchors.bottomMargin: 4
                        Text {
                            id: cost4Text
                            visible: true
                            color: textColor
                            text: "Cost 4"
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                            font.pointSize: 30
                        }

                        DropShadow {
                            id: cost4DropShadow
                            opacity: 0.8
                            visible: false
                            color: "#095f0c"
                            radius: 3.8
                            anchors.fill: cost4Text
                            source: cost4Text
                            verticalOffset: 3
                            samples: 16
                            horizontalOffset: 3
                        }

                        Text {
                            id: cost4DropText
                            visible: false
                            color: dropTextColor
                            text: cost4Text.text
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            font.pointSize: cost4Text.font.pointSize
                            z: 0
                            minimumPointSize: 6
                            minimumPixelSize: 6
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                        }

                        Rectangle {
                            id: cost4BlockHighlight
                            x: -8
                            y: -4
                            visible: false
                            color: "#00ffffff"
                            radius: 4
                            border.color: "#25fb2e"
                            border.width: 1
                            anchors.fill: parent
                            anchors.leftMargin: 3
                            anchors.rightMargin: 3
                            anchors.topMargin: 3
                            anchors.bottomMargin: 3
                        }

                        Rectangle {
                            id: cost4ImageBlock
                            color: "#00ffffff"
                            radius: 10
                            border.color: "#0002d20b"
                            border.width: 0
                            anchors.fill: parent
                            clip: true
                            scale: 0.9
                            Image {
                                id: cost4Image
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
                                    maskSource: cost4Mask
                                    layer.textureSize.width: 0
                                    layer.textureSize.height: 0
                                    layer.enabled: true
                                    enabled: true
                                    clip: false
                                }
                                fillMode: Image.Pad
                                clip: false

                                Rectangle {
                                    id: cost4Dimmer
                                    opacity: 1
                                    visible: false
                                    color: "#83474747"
                                    anchors.fill: parent
                                }
                            }

                            Rectangle {
                                id: cost4Mask
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
                        }


                        Image {
                            id: colorless4DummyImage
                            x: -156
                            y: -156
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
                                maskSource: colorless4Mask
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
                            id: colorless4Mask
                            x: 0
                            y: 0
                            width: 38
                            height: 38
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
                            id: dragon4DummyImage
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
                            scale: 0.85
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                width: 34
                                height: 34
                                opacity: 0
                                visible: true
                                scale: 1
                                maskSource: dragon4Mask
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
                            id: dragon4Mask
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

                        clip: true
                    }
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 60
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

            }

            Rectangle {
                id: cost5Block
                width: 50
                height: 50
                visible: true
                color: mainColor
                radius: 6
                border.color: "#6c0101"
                border.width: 2

                Rectangle {
                    id: cost5Bezel
                    visible: true
                    color: "#b2b2b2"
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
                        id: cost5Screen
                        x: 7
                        y: 4
                        color: dimScreenColor
                        radius: 4
                        border.color: screenShadeColor
                        border.width: 2
                        anchors.fill: parent
                        anchors.leftMargin: 4
                        anchors.rightMargin: 4
                        anchors.topMargin: 4
                        anchors.bottomMargin: 4
                        Text {
                            id: cost5Text
                            visible: true
                            color: textColor
                            text: "Cost 5"
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            state: "base state4"
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                            font.pointSize: 30
                        }

                        // DropShadow {
                        //     id: cost5DropShadow
                        //     opacity: 0.8
                        //     visible: false
                        //     color: "#095f0c"
                        //     radius: 3.8
                        //     anchors.fill: cost5Text
                        //     source: cost5Text
                        //     verticalOffset: 3
                        //     samples: 16
                        //     horizontalOffset: 3
                        // }

                        Text {
                            id: cost5DropText
                            visible: false
                            color: dropTextColor
                            text: cost5Text.text
                            anchors.fill: parent
                            anchors.leftMargin: 2
                            anchors.rightMargin: 2
                            anchors.topMargin: 2
                            anchors.bottomMargin: 2
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                            font.pointSize: cost5Text.font.pointSize
                            z: 0
                            minimumPointSize: 4
                            minimumPixelSize: 4
                            fontSizeMode: Text.Fit
                            font.styleName: "Bold Italic"
                        }

                        Rectangle {
                            id: cost5BlockHightlight
                            x: -8
                            y: -4
                            visible: false
                            color: "#00ffffff"
                            radius: 4
                            border.color: "#25fb2e"
                            border.width: 1
                            anchors.fill: parent
                            anchors.leftMargin: 3
                            anchors.rightMargin: 3
                            anchors.topMargin: 3
                            anchors.bottomMargin: 3
                        }

                        Rectangle {
                            id: cost5ImageBlock
                            color: "#00ffffff"
                            radius: 10
                            border.color: "#0002d20b"
                            border.width: 0
                            anchors.fill: parent
                            clip: true
                            scale: 0.9
                            Image {
                                id: cost5Image
                                x: -154
                                y: -154
                                width: 350
                                height: 350
                                opacity: 1
                                visible: true
                                // source: ""
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
                                    maskSource: cost5Mask
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
                                id: cost5Mask
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
                        }

                        Image {
                            id: colorless5DummyImage
                            x: -156
                            y: -156
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
                                maskSource: colorless5Mask
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
                            id: colorless5Mask
                            x: 0
                            y: 0
                            width: 38
                            height: 38
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
                            id: dragon5DummyImage
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
                            scale: 0.85
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                width: 34
                                height: 34
                                opacity: 0
                                visible: true
                                scale: 1
                                maskSource: dragon5Mask
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
                            id: dragon5Mask
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

                        clip: true
                    }
                }
            }





        }
    }

    Rectangle {
        id: descriptionBlock
        x: 0
        color: mainColor
        radius: 8
        border.color: borderColor
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: costBlock.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: -4
        anchors.bottomMargin: 2

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
                    text: "Attack Description"
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
