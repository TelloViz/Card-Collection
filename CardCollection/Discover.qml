import QtQuick 2.13
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import Qt5Compat.GraphicalEffects


Item { // Page 2: Discover Page

    focus: true
    id: discoverPage
    width: 700
    height: 615
    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
    Layout.preferredWidth: 600
    Layout.preferredHeight: 600
    Layout.fillHeight: false
    Layout.fillWidth: false

    property int drawerAnimationDuration: 200 // Adjust to match your animation duration
    property int lockTimerDuration: 500
    // Timer to lock the toggle button for the animation duration

    // Define color scheme properties
    property color pressedToggleColor: "#02d20b"
    property color releasedToggleColor: "#c80d0d"
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
    property color deepBG: "#541515"
    property color blockBorderHightlight: "#ee0000"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"
    property color dropBorderColor: "#25fb2e"

    // Add a boolean variable to track the drawer's state
    property bool isDrawerOpen: false // Start with the drawer closed
    property bool isDrawer2Open: false // Start with the drawer closed

    property int selectedIndex: 0
    property var cards: [] // List of card objects

    function toggleLeftDrawer() {
        toggleLockTimer.start(); // Start the timer to re-enable the button

        if (customDrawer.x < 0) {

            customDrawer.x = 0
            isDrawerOpen = true

            // Animate ball button rotation on drawer open
            rotateAnimation.from = ballButton.rotation
            rotateAnimation.to = 90 // Rotate by 90 degrees
            rotateAnimation.start()
        } else {

            customDrawer.x = -customDrawer.width // hide drawer
            isDrawerOpen = false

            // Animate rotation on drawer close
            rotateAnimation.from = ballButton.rotation
            rotateAnimation.to = 270 // Reset to 0 degrees rotation
            rotateAnimation.start()
        }
    }

    function toggleRightDrawer() {
        toggleLockTimer.start(); // Start the timer to re-enable the button

        if (customDrawer2.x >= 700) { // Closed position
            customDrawer2.x = 700 - customDrawer2.width; // Slide into view
            isDrawer2Open = true;

            rotateAnimation2.from = ballButton2.rotation;
            rotateAnimation2.to = 270;
            rotateAnimation2.start();
        } else { // Open position
            customDrawer2.x = 700; // Hide off the right edge
            isDrawer2Open = false;
            rotateAnimation2.from = ballButton2.rotation;
            rotateAnimation2.to = 90;
            rotateAnimation2.start();
        }
    }

    function toggleBothDrawers() {
        // Disable the toggle button to prevent rapid clicks
        toggleLockTimer.start(); // Start the timer to re-enable the button
        toggleLeftDrawer();
        toggleRightDrawer();
    }


    // Function to update attack information based on selectedIndex
    function updateAttackInfo() {
        if (cards[selectedIndex]) {

            const defaultCost1 = "Cost 1";
            const defaultCost2 = "Cost 2";
            const defaultCost3 = "Cost 3";
            const defaultCost4 = "Cost 4";
            const defaultCost5 = "Cost 5";

            // Create costs objects from the selected card for each attack
            const attack1Costs = {
                cost1: cards[selectedIndex].attack1Cost1 || defaultCost1,
                cost2: cards[selectedIndex].attack1Cost2 || defaultCost2,
                cost3: cards[selectedIndex].attack1Cost3 || defaultCost3,
                cost4: cards[selectedIndex].attack1Cost4 || defaultCost4,
                cost5: cards[selectedIndex].attack1Cost5 || defaultCost5
            };

            const attack2Costs = {
                cost1: cards[selectedIndex].attack2Cost1 || defaultCost1,
                cost2: cards[selectedIndex].attack2Cost2 || defaultCost2,
                cost3: cards[selectedIndex].attack2Cost3 || defaultCost3,
                cost4: cards[selectedIndex].attack2Cost4 || defaultCost4,
                cost5: cards[selectedIndex].attack2Cost5 || defaultCost5

            };

            const attack3Costs = {
                cost1: cards[selectedIndex].attack3Cost1 || defaultCost1,
                cost2: cards[selectedIndex].attack3Cost2 || defaultCost2,
                cost3: cards[selectedIndex].attack3Cost3 || defaultCost3,
                cost4: cards[selectedIndex].attack3Cost4 || defaultCost4,
                cost5: cards[selectedIndex].attack3Cost5 || defaultCost5

            };

            const attack4Costs = {
                cost1: cards[selectedIndex].attack4Cost1 || defaultCost1,
                cost2: cards[selectedIndex].attack4Cost2 || defaultCost2,
                cost3: cards[selectedIndex].attack4Cost3 || defaultCost3,
                cost4: cards[selectedIndex].attack4Cost4 || defaultCost4,
                cost5: cards[selectedIndex].attack4Cost5 || defaultCost5

            };

            // Update attack blocks
            attack1Block.updateAttack(cards[selectedIndex].attack1Name, cards[selectedIndex].attack1Text, 0, attack1Costs);
            attack2Block.updateAttack(cards[selectedIndex].attack2Name, cards[selectedIndex].attack2Text, 1, attack2Costs);
            attack3Block.updateAttack(cards[selectedIndex].attack3Name, cards[selectedIndex].attack3Text, 2, attack3Costs);
            attack4Block.updateAttack(cards[selectedIndex].attack4Name, cards[selectedIndex].attack4Text, 3, attack4Costs);

        }
    }

    // Function to update ability information based on selectedIndex
    function updateAbilityInfo() {

        if (cards[selectedIndex]) {
            // Update ability text fields first
            ability1.nameText = cards[selectedIndex].ability1Name
                    || "Ability 1"
            ability1.descText = cards[selectedIndex].ability1Text
                    || "No description available."
            ability1.typeText = cards[selectedIndex].ability1Type || "Ability 1 Type"

            ability2.nameText = cards[selectedIndex].ability2Name
                    || "Ability 2"
            ability2.descText = cards[selectedIndex].ability2Text
                    || "No description available."
            ability2.typeText = cards[selectedIndex].ability2Type || "Ability 2 Type"

            ability1.isVisible = cards[selectedIndex].ability1Name !== "Ability 1" && cards[selectedIndex].ability1Name !== ""

            ability2.isVisible = cards[selectedIndex].ability2Name !== "Ability 2" && cards[selectedIndex].ability2Name !== ""
        }
    }

    function updateSubTypeInfo() {
        if(cards[selectedIndex]) {
            //subtypeBlock.subtype1

            subtypeBlock1.sub1Text = cards[selectedIndex].subtype1
                    || "Sub Type 1"
            subtypeBlock1.sub2Text = cards[selectedIndex].subtype2
                    || "Sub Type 2"
            subtypeBlock1.sub3Text = cards[selectedIndex].subtype3
                    || "Sub Type 3"
            subtypeBlock1.sub4Text = cards[selectedIndex].subtype4
                    || "Sub Type 4"

            subtypeBlock1.updateSubTypeInfo();

            if(!subtypeBlock1.visible && !typeBlock1.visible) {
                typesRow1.height = 0;
            }
            else {
                typesRow1.height = 106;
            }

            // console.log(subtypeBlock1.sub1Text)
        }

    }

    function updateSuperTypeInfo() {
        if(cards[selectedIndex]) {
            supertypeText1.text = cards[selectedIndex].supertype
                    || "Super Type"
        }
    }

    function updateTypeInfo() {
        const defaultType1 = "Type 1";
        const defaultType2 = "Type 2";

        // Type mapping for potential image sources (update URLs if needed)
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
            "dragon": "dragonEnergyCropped.png",
            "colorless": "colorlessEnergyCropped.png"
        };

        // Check if the card exists
        if (!cards[selectedIndex]) {
            // console.log("cards[selectedIndex] doesn't exist")
            // Reset to defaults if no card is selected
            typeBlock1.type1Type = defaultType1;
            typeBlock1.type2Type= defaultType2;
            return; // Exit early if no card is found
        }
        else {
            //  console.log(cards[selectedIndex].type1)
        }

        // Normalize type strings for image source mapping
        const normalizedType1 = cards[selectedIndex]?.type1?.trim().toLowerCase() || "";
        const normalizedType2 = cards[selectedIndex]?.type2?.trim().toLowerCase() || "";

        typeBlock1.type1Type = normalizedType1 || defaultType1;
        typeBlock1.type2Type = normalizedType2 || defaultType2;

        if(typeBlock1.type1Type === defaultType1 && typeBlock.type2Type === defaultType2) {

            typeBlock1.visible = false;
        }
        else {
            typeBlock1.visible = true;
        }

        if(typeBlock1.visible && subtypeBlock1.visible) {

            typesRow1.width = typeBlock1.width + subtypeBlock1.width

        } else if (typeBlock1.visible && !subtypeBlock1.visible) {

            typesRow1.width = typeBlock1.width

        } else if (!typeBlock1.visible && subtypeBlock1.visible) {
            typesRow1.width = subtypeBlock1.width
        }


    }

    function updateFlavorText() {
        if(cards[selectedIndex] && cards[selectedIndex].flavorText !== "") {
            // console.log();
            flavorTextBlock1.descText = cards[selectedIndex].flavorText;
            rule1TextBlock.descText = cards[selectedIndex].rule1;
            rule2TextBlock.descText = cards[selectedIndex].rule2;
            rule3TextBlock.descText = cards[selectedIndex].rule3;
            rule4TextBlock.descText = cards[selectedIndex].rule4;

            flavorTextBlock1.visible = flavorTextBlock1.descText !== "" && flavorTextBlock1.descText !== "Flavor Text"
            rule1TextBlock.visible = rule1TextBlock.descText !== "" && rule1TextBlock.descText !== "Rule 1"
            rule2TextBlock.visible = rule2TextBlock.descText !== "" && rule2TextBlock.descText !== "Rule 2"
            rule3TextBlock.visible = rule3TextBlock.descText !== "" && rule3TextBlock.descText !== "Rule 3"
            rule4TextBlock.visible = rule4TextBlock.descText !== "" && rule4TextBlock.descText !== "Rule 4"
        }
    }

    function updateLeftScrollView() {
        let leftContentHeight = 0;
        let visibleItemsCount = 0; // Counter for visible items

        // Check and add heights for attack blocks
        if (attack1Block.visible) {
            leftContentHeight += attack1Block.height;
            visibleItemsCount++;
        }
        if (attack2Block.visible) {
            leftContentHeight += attack2Block.height;
            visibleItemsCount++;
        }
        if (attack3Block.visible) {
            leftContentHeight += attack3Block.height;
            visibleItemsCount++;
        }
        if (attack4Block.visible) {
            leftContentHeight += attack4Block.height;
            visibleItemsCount++;
        }

        // Check and add heights for ability blocks
        if (ability1.visible) {
            leftContentHeight += ability1.height;
            visibleItemsCount++;
        }
        if (ability2.visible) {
            leftContentHeight += ability2.height;
            visibleItemsCount++;
        }

        // Check and add heights for rule text blocks
        if (rule1TextBlock.visible) {
            leftContentHeight += rule1TextBlock.height;
            visibleItemsCount++;
        }
        if (rule2TextBlock.visible) {
            leftContentHeight += rule2TextBlock.height;
            visibleItemsCount++;
        }
        if (rule3TextBlock.visible) {
            leftContentHeight += rule3TextBlock.height;
            visibleItemsCount++;
        }
        if (rule4TextBlock.visible) {
            leftContentHeight += rule4TextBlock.height;
            visibleItemsCount++;
        }

        // Add spacing for the visible items, if there are any
        if (visibleItemsCount > 0) {
            leftContentHeight += (visibleItemsCount - 1) * leftSideColumn.spacing; // Spacing between elements
        }

        leftScrollView.contentHeight = leftContentHeight; // Set the final content height
    }

    function updateRightScrollView() {
        let rightContentHeight = 0;
        let visibleItemsCount = 0; // Counter for visible items

        // Check and add heights for the items in the rightSideColumn
        if (typesRow.visible) {
            rightContentHeight += typesRow.height;
            visibleItemsCount++;
        }
        if (supertypeBlock.visible) {
            rightContentHeight += supertypeBlock.height;
            visibleItemsCount++;
        }
        if (nameBlock.visible) {
            rightContentHeight += nameBlock.height;
            visibleItemsCount++;
        }
        if (flavorTextBlock.visible) {
            rightContentHeight += flavorTextBlock.height;
            visibleItemsCount++;
        }
        if (setLogoBlock.visible) {
            rightContentHeight += setLogoBlock.height;
            visibleItemsCount++;
        }
        if (setSymbolRow.visible) {
            rightContentHeight += setSymbolRow.height;
            visibleItemsCount++;
        }

        // Add spacing for the visible items, if there are any
        if (visibleItemsCount > 0) {
            rightContentHeight += (visibleItemsCount - 1) * rightSideColumn.spacing; // Spacing between elements
        }

        rightScrollView.contentHeight = rightContentHeight; // Set the final content height
    }



    function resetCardRotation() {
        momentumTimer.stop()
        cardNode.eulerRotation.y = 0;
    }
    function resetLeftColumnScroll() {
        //leftScrollView.contentX = 0;
        //leftScrollView.contentY = 0;
    }

    function resetRightColumnScroll() {
        //rightScrollView.contentX = 0;
        //rightScrollView.contentY = 0;
    }

    // Function to handle next button click
    function onNextCard() {
        if (selectedIndex < cards.length - 1) {
            selectedIndex++
            updateAttackInfo(); // Update UI for the new selectedIndex
            updateAbilityInfo();
            updateSubTypeInfo();
            updateSuperTypeInfo();
            updateTypeInfo();
            updateFlavorText();
            resetLeftColumnScroll();
            resetRightColumnScroll();
            resetCardRotation();
            updateLeftScrollView();
            //updateRightScrollView();
        }
    }

    // Function to handle next button click
    function onPrevCard() {
        if (selectedIndex >= 0) {
            selectedIndex--
            updateAttackInfo(); // Update UI for the new selectedIndex
            updateAbilityInfo();
            updateSubTypeInfo();
            updateSuperTypeInfo();
            updateTypeInfo();
            updateFlavorText();
            resetLeftColumnScroll();
            resetRightColumnScroll();
            resetCardRotation();
            //updateLeftScrollView();
            //updateRightScrollView();
        }
    }


    Column {
        id: column
        x: 0
        y: 0
        width: 700
        height: 615
        z: 1



        Rectangle {
            id: rectangle27
            width: 700
            height: 20
            color: blockBG
            border.width: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            z: 0
            Rectangle {
                id: rectangle28
                y: -600
                color: "#951111"
                radius: 4
                border.color: "#cc1c1c"
                border.width: 8
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                z: 0
            }

            Rectangle {
                id: rectangle29
                color: "#00951111"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                z: 0
            }

            Rectangle {
                id: rectangle30
                color: "#00951111"
                radius: 4
                border.color: "#6c0101"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 5
                anchors.bottomMargin: 4
                z: 0
            }

            Rectangle {
                id: rectangle31
                y: 20
                color: "#00951111"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                z: 0
            }
        }

        Rectangle {
            id: rectangle4
            width: 700
            height: 440
            visible: true
            color: deepBG
            radius: 0
            border.color: borderColor
            border.width: 4
            z: 1

            Pane {
                id: viewPane
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                verticalPadding: 6
                topPadding: 0
                rightPadding: 0
                leftPadding: 0
                horizontalPadding: 6
                contentWidth: 700
                contentHeight: 440
                Rectangle {
                    visible: true
                    color: dataFlow.color
                    radius: 0
                    border.color: "#00255864"
                    border.width: 0
                    anchors.fill: parent
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    z: 0
                }

                Rectangle {
                    id: customDrawer
                    x: -324
                    width: 324
                    height: 438
                    opacity: 1
                    visible: true
                    color: "#541515"
                    radius: 4
                    border.color: "#580a0a"
                    border.width: 6
                    anchors.verticalCenter: parent.verticalCenter
                    z: 1
                    scale: 1
                    // Animate the x position when it changes
                    Behavior on x {
                        NumberAnimation {
                            duration: 500 // Adjust the duration for the desired speed
                            easing.type: Easing.OutQuad // Smooth easing effect
                        }
                    }

                    MouseArea {
                        visible: true
                        anchors.fill: parent
                        anchors.leftMargin: 1
                        anchors.rightMargin: -1
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }


                    Rectangle {
                        id: rectangle2
                        x: -290
                        width: 274
                        height: 438
                        visible: true
                        color: "#00ffffff"
                        radius: 3
                        border.color: "#ff0000"
                        border.width: 4
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        z: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    clip: true
                    anchors.verticalCenterOffset: 0
                    Flickable {
                        id: dataScrollView
                        anchors.fill: parent
                        contentWidth: 368

                        contentHeight: 1651

                        Column {
                            id: leftSideColumn
                            y: 8
                            width: 290
                            height: 536
                            anchors.horizontalCenterOffset: -22
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 4
                            FlavorTextBlock {
                                id: rule1TextBlock
                                width: 290
                                height: 100
                                anchors.horizontalCenter: parent.horizontalCenter
                                screenShadeColor: window.screenShadeColor
                                screenHighlightColor: window.screenHighlightColor
                                screenColor: window.screenColor
                                descText: "Rule 1"
                                blockBG: window.blockBG
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                            }

                            FlavorTextBlock {
                                id: rule2TextBlock
                                width: 290
                                height: 100
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                screenShadeColor: window.screenShadeColor
                                screenHighlightColor: window.screenHighlightColor
                                screenColor: window.screenColor
                                descText: "Rule 2"
                                blockBG: window.blockBG
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                            }

                            FlavorTextBlock {
                                id: rule3TextBlock
                                width: 290
                                height: 100
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                screenShadeColor: window.screenShadeColor
                                screenHighlightColor: window.screenHighlightColor
                                screenColor: window.screenColor
                                descText: "Rule 3"
                                blockBG: window.blockBG
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                            }

                            FlavorTextBlock {
                                id: rule4TextBlock
                                width: 290
                                height: 100
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                screenShadeColor: window.screenShadeColor
                                screenHighlightColor: window.screenHighlightColor
                                screenColor: window.screenColor
                                descText: "Rule 4"
                                blockBG: window.blockBG
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                            }

                            AttackInfoBlock {
                                id: attack1Block
                                width: 290
                                height: 200
                                visible: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                textColor: window.textColor
                                screenColor: window.screenColor
                                nameText: "Attack 1"
                                mainColor: window.primaryColor
                                dropTextColor: window.dropTextColor
                                dropBorderColor: window.dropBorderColor
                                borderColor: window.borderColor
                                bezelColor: window.bezelColor
                            }

                            AttackInfoBlock {
                                id: attack2Block
                                width: 290
                                height: 200
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                textColor: window.textColor
                                screenColor: window.screenColor
                                nameText: "Attack 2"
                                mainColor: window.primaryColor
                                dropTextColor: window.dropTextColor
                                dropBorderColor: window.dropBorderColor
                                borderColor: window.borderColor
                                bezelColor: window.bezelColor
                            }

                            AttackInfoBlock {
                                id: attack3Block
                                width: 290
                                height: 200
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                textColor: window.textColor
                                screenColor: window.screenColor
                                nameText: "Attack 3"
                                mainColor: window.primaryColor
                                dropTextColor: window.dropTextColor
                                dropBorderColor: window.dropBorderColor
                                borderColor: window.borderColor
                                bezelColor: window.bezelColor
                            }

                            AttackInfoBlock {
                                id: attack4Block
                                width: 290
                                height: 200
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                textColor: window.textColor
                                screenColor: window.screenColor
                                nameText: "Attack 4"
                                mainColor: window.primaryColor
                                dropTextColor: window.dropTextColor
                                dropBorderColor: window.dropBorderColor
                                borderColor: window.borderColor
                                bezelColor: window.bezelColor
                            }

                            AbilityInfoBlock {
                                id: ability1
                                width: 290
                                anchors.horizontalCenter: parent.horizontalCenter
                                typeText: "Ability 1 Type"
                                nameText: "Ability 1"
                                descText: "Ability 1 Description"
                            }

                            AbilityInfoBlock {
                                id: ability2
                                width: 290
                                visible: false
                                anchors.horizontalCenter: parent.horizontalCenter
                                typeText: "Ability 2 Type"
                                nameText: "Ability 2"
                                descText: "Ability 2 Description"
                            }
                        }
                    }
                }

                // Define the animation
                PropertyAnimation {
                    id: drawerAnimation
                    target: customDrawer
                    property: "x"
                    alwaysRunToEnd: true
                    running: false
                    duration: drawerAnimationDuration  // Duration of the animation in milliseconds
                    easing.type: Easing.InOutQuad  // Easing function for smoothness
                }

                MouseArea {
                    id: openButton
                    width: 28
                    height: parent.height
                    opacity: 1
                    anchors.verticalCenter: customDrawer.verticalCenter
                    anchors.left: customDrawer.right
                    anchors.leftMargin: -1
                    z: 1
                    onExited: {
                        // Scale down when not hovered
                        ballButton.scale = 0.6
                    }
                    onEntered: {
                        // Scale up on hover
                        ballButton.scale = 0.7
                    }
                    onClicked: {
                        toggleLeftDrawer();
                    }
                    hoverEnabled: true
                    Rectangle {
                        id: buttonBackground
                        color: "#ee1414"
                        radius: 0
                        border.color: "#620808"
                        border.width: 2
                        anchors.fill: parent
                        MouseArea {
                            onClicked: {
                                toggleLeftDrawer();
                            }
                        }

                        Rectangle {
                            id: rectangle32
                            color: "#00ffffff"
                            radius: 3
                            border.color: "#ee0000"
                            border.width: 2
                            anchors.fill: parent
                            anchors.leftMargin: 5
                            anchors.rightMargin: 5
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                        }
                    }

                    Rectangle {
                        id: drawerCircle
                        x: 8
                        width: 26
                        height: 26
                        visible: false
                        color: "#6c0101"
                        radius: 9
                        border.color: "#c80d0d"
                        border.width: 2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: -10
                        Behavior {
                            NumberAnimation {
                                duration: 200
                            }
                        }

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            onExited: {
                                // Scale down when not hovered
                                drawerCircle.scale = 1
                            }
                            onEntered: {
                                // Scale up on hover
                                drawerCircle.scale = 1.2
                            }
                            onClicked: {
                                toggleLeftDrawer();
                            }
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    Image {
                        id: ballButton
                        width: 80
                        height: 80
                        anchors.verticalCenter: parent.verticalCenter
                        source: "topBall.png"
                        anchors.horizontalCenterOffset: 13
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize.height: 50
                        scale: 0.6
                        rotation: 270
                        mirror: false
                        mipmap: false
                        fillMode: Image.Stretch
                        NumberAnimation {
                            id: rotateAnimation
                            target: ballButton
                            property: "rotation"
                            duration: 500
                        }

                        MouseArea {
                            id: ballMouseArea
                            width: 60
                            height: 32
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: 15
                            anchors.horizontalCenter: parent.horizontalCenter
                            onExited: {
                                // Scale down when not hovered
                                ballButton.scale = 0.6
                            }
                            onEntered: {
                                // Scale up on hover
                                ballButton.scale = 0.7
                            }
                            onClicked: {
                                toggleLeftDrawer();
                            }
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }
                        autoTransform: false
                        anchors.verticalCenterOffset: 0
                    }
                    cursorShape: Qt.PointingHandCursor



                }

                Rectangle {
                    id: dataFlow
                    width: 700
                    height: 440
                    opacity: 1
                    visible: true
                    color: "#541515"
                    border.width: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.horizontalCenter: parent.horizontalCenter
                    Frame {
                        id: frame
                        width: 700
                        height: 440
                        visible: true
                        anchors.verticalCenter: parent.verticalCenter
                        z: 0
                        contentWidth: 700
                        contentHeight: 440
                        anchors.horizontalCenter: parent.horizontalCenter
                        padding: 0
                        rightPadding: 0
                        bottomPadding: 0
                        leftPadding: 0
                        topPadding: 0
                        clip: false
                        View3D {
                            id: view
                            width: 605
                            height: 430
                            scale: 1
                            clip: false
                            z: 1
                            visible: true
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            PerspectiveCamera {
                                y: 0
                                position: Qt.vector3d(0, 200, 300)
                                pivot.z: 0
                                pivot.y: 0
                                pivot.x: 0
                                lookAtNode: cardNode
                                frustumCullingEnabled: false
                                z: 0
                                eulerRotation.x: 0
                            }

                            DirectionalLight {
                                eulerRotation.x: -30
                            }

                            Node {
                                id: cardNode
                                x: 0
                                y: 200
                                visible: true
                                z: -25
                                scale.y: 3.5
                                scale.x: 2.5

                                // Front side of the card
                                Model {
                                    id: frontCard
                                    source: "#Rectangle"
                                    receivesShadows: false
                                    castsShadows: false
                                    scale: Qt.vector3d(1, 1, 1) // Adjust dimensions for card thickness
                                    eulerRotation.y: 0

                                    materials: [
                                        DefaultMaterial {
                                            diffuseMap: Texture {
                                                sourceItem: Image {
                                                    anchors.centerIn: parent
                                                    width: 413
                                                    height: 577
                                                    source: (selectedIndex >= 0 && selectedIndex < cards.length) ? cards[selectedIndex].imageUrl : ""
                                                    sourceSize: Qt.size(width, height)
                                                    cache: false
                                                }
                                            }
                                        }
                                    ]
                                }

                                // Back side of the card, rotated 180 degrees
                                Model {
                                    id: backCard
                                    source: "#Rectangle"
                                    scale: Qt.vector3d(1, 1, 1)
                                    eulerRotation.y: 180 // Rotated to face the opposite direction

                                    materials: [
                                        DefaultMaterial {
                                            diffuseColor: "#ffffff"
                                            diffuseMap: Texture {
                                                sourceItem: Image {
                                                    anchors.centerIn: parent
                                                    width: 413
                                                    height: 577
                                                    source: "cardback.png" // URL for the back image
                                                    sourceSize: Qt.size(width, height)
                                                    cache: false
                                                }
                                            }
                                        }
                                    ]
                                }
                            }

                            MouseArea {
                                id: dragArea
                                property real previousX: 0
                                property real velocityY: 0
                                property real dragSensitivity: 0.2
                                property real momentumDecay: 0.98
                                width: 700
                                height: 440
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                // Controls how quickly momentum fades

                                onPressed: {
                                    previousX = mouse.x
                                    velocityY = 0
                                    momentumTimer.stop()
                                    returnToZeroTimer.stop(); // Stop the return to zero timer when dragging
                                }

                                onPositionChanged: {
                                    var deltaX = mouse.x - previousX
                                    velocityY = deltaX * dragSensitivity
                                    cardNode.eulerRotation.y += velocityY
                                    previousX = mouse.x
                                }

                                onReleased: {
                                    momentumTimer.start() // Start applying momentum after release
                                }
                            }

                            // Timer for applying momentum after drag release
                            Timer {
                                id: momentumTimer
                                interval: 16 // About 60 FPS
                                repeat: true
                                onTriggered: {
                                    if (Math.abs(dragArea.velocityY) < 0.1) {
                                        // If the velocity is low, stop the momentum and start returning to zero
                                        momentumTimer.stop();
                                        returnToZeroTimer.start(); // Start the return to zero timer
                                    } else {
                                        cardNode.eulerRotation.y += dragArea.velocityY; // Apply the current velocity
                                        dragArea.velocityY *= dragArea.momentumDecay; // Decay the velocity
                                    }
                                }
                            }

                            // Timer for gradually returning to zero rotation on the Y-axis
                            Timer {
                                id: returnToZeroTimer
                                interval: 16 // About 60 FPS
                                repeat: true
                                onTriggered: {
                                    if (Math.abs(cardNode.eulerRotation.y) < 0.1) {
                                        cardNode.eulerRotation.y = 0; // Set to zero to avoid oscillation
                                        returnToZeroTimer.stop(); // Stop the timer when close enough to zero
                                    } else {
                                        // Gradually reduce the angle towards zero
                                        var returnSpeed = 0.07; // Adjust the return speed to control how quickly it comes to rest
                                        if (cardNode.rotation.y > 0) {
                                            // console.log(cardNode.rotation.y)
                                            //console.log(cardNode.eulerRotation.y)
                                            cardNode.rotation.y -= returnSpeed; // Move back towards 0
                                            if (cardNode.rotation.y < 0) cardNode.rotation.y = 0; // Clamp to zero
                                        } else {
                                            cardNode.rotation.y += returnSpeed; // Move back towards 0
                                            if (cardNode.rotation.y > 0) cardNode.rotation.y = 0; // Clamp to zero
                                        }
                                    }
                                }
                            }

                        }

                        Rectangle {
                            id: rectangle5
                            width: 700
                            height: 447
                            visible: true
                            color: deepBG
                            border.width: 0
                            anchors.verticalCenter: parent.verticalCenter
                            z: 0
                        }

                        Rectangle {
                            x: 55
                            y: 10
                            width: 590
                            height: 420
                            color: "#d5290202"
                            anchors.verticalCenter: parent.verticalCenter
                            z: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }



                    clip: true
                }


                MouseArea {
                    id: openButton2
                    x: 572
                    width: 28
                    height: parent.height
                    opacity: 1
                    anchors.verticalCenter: customDrawer2.verticalCenter
                    anchors.right: customDrawer2.left
                    anchors.rightMargin: -1
                    z: 1
                    onExited: {
                        // Scale down when not hovered
                        ballButton2.scale = 0.6
                    }
                    onEntered: {
                        // Scale up on hover
                        ballButton2.scale = 0.7
                    }
                    onClicked: {
                        toggleRightDrawer();
                    }
                    hoverEnabled: true
                    Rectangle {
                        id: buttonBackground2
                        color: "#ee1414"
                        radius: 0
                        border.color: "#620808"
                        border.width: 2
                        anchors.fill: parent
                        MouseArea {
                            onClicked: {
                                toggleRightDrawer();
                            }
                        }

                        Rectangle {
                            id: rectangle41
                            color: "#00ffffff"
                            radius: 3
                            border.color: "#ee0000"
                            border.width: 2
                            anchors.fill: parent
                            anchors.leftMargin: 5
                            anchors.rightMargin: 5
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                        }
                    }

                    Rectangle {
                        id: drawerCircle2
                        x: 8
                        width: 26
                        height: 26
                        visible: false
                        color: "#6c0101"
                        radius: 9
                        border.color: "#c80d0d"
                        border.width: 2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        Behavior {
                            NumberAnimation {
                                duration: 200
                            }
                        }

                        MouseArea {
                            id: mouseArea2
                            anchors.fill: parent
                            onExited: {
                                // Scale down when not hovered
                                drawerCircle2.scale = 1
                            }
                            onEntered: {
                                // Scale up on hover
                                drawerCircle2.scale = 1.2
                            }
                            onClicked: {
                                toggleRightDrawer();
                            }
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    Image {
                        id: ballButton2
                        width: 80
                        height: 80
                        anchors.verticalCenter: parent.verticalCenter
                        source: "bottomBall.png"
                        anchors.horizontalCenterOffset: -13
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize.height: 50
                        scale: 0.6
                        rotation: 90
                        mirror: false
                        mipmap: false
                        fillMode: Image.Stretch
                        NumberAnimation {
                            id: rotateAnimation2
                            target: ballButton2
                            property: "rotation"
                            duration: 500
                        }

                        MouseArea {
                            id: ballMouseArea2
                            width: 60
                            height: 30
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.verticalCenterOffset: 15
                            anchors.horizontalCenter: parent.horizontalCenter
                            onExited: {
                                // Scale down when not hovered
                                ballButton2.scale = 0.6
                            }
                            onEntered: {
                                // Scale up on hover
                                ballButton2.scale = 0.7
                            }
                            onClicked: {
                                toggleRightDrawer();
                            }
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }
                        autoTransform: false
                        anchors.verticalCenterOffset: 0
                    }
                    cursorShape: Qt.PointingHandCursor

                    // Define the animation
                    PropertyAnimation {
                        id: drawerAnimation2
                        target: customDrawer2
                        property: "x"
                        alwaysRunToEnd: true
                        duration: drawerAnimationDuration  // Duration of the animation in milliseconds
                        easing.type: Easing.InOutQuad  // Easing function for smoothness

                    }

                }

                bottomPadding: 0
                Layout.margins: 0
                Layout.fillWidth: true
                Layout.fillHeight: true
                Rectangle {
                    id: customDrawer2
                    x: 700
                    width: 324
                    height: 438
                    opacity: 1
                    visible: true
                    color: deepBG
                    radius: 8
                    border.color: "#580a0a"
                    border.width: 7
                    anchors.verticalCenter: parent.verticalCenter
                    z: 0
                    scale: 1
                    // Animate the x position when it changes
                    Behavior on x {
                        NumberAnimation {
                            duration: 500 // Adjust the duration for the desired speed
                            easing.type: Easing.OutQuad // Smooth easing effect
                        }
                    }

                    MouseArea {
                        visible: true
                        anchors.fill: parent
                        anchors.leftMargin: 1
                        anchors.rightMargin: -1
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }

                    Rectangle {
                        id: rectangle3
                        x: -290
                        width: 274
                        height: 438
                        visible: true
                        color: "#00ffffff"
                        radius: 3
                        border.color: "#ff0000"
                        border.width: 4
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        z: 1
                        clip: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Flickable {
                        id: dataScrollView1
                        anchors.fill: parent

                        Column {
                            id: rightSideColumn1
                            y: 8
                            width: 290
                            height: 430
                            anchors.horizontalCenterOffset: -22
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 3
                            Rectangle {
                                id: supertypeBlock1
                                width: 200
                                height: 40
                                color: "#c80d0d"
                                radius: 8
                                border.color: "#6c0101"
                                border.width: 2
                                anchors.horizontalCenter: parent.horizontalCenter
                                Rectangle {
                                    id: rectangle37
                                    color: "#b2b2b2"
                                    radius: 8
                                    border.color: "#616161"
                                    border.width: 2
                                    anchors.fill: parent
                                    anchors.leftMargin: 4
                                    anchors.rightMargin: 4
                                    anchors.topMargin: 3
                                    anchors.bottomMargin: 3
                                }

                                Rectangle {
                                    id: supertypeScreen1
                                    color: screenColor
                                    radius: 4
                                    border.color: "#128c17"
                                    border.width: 2
                                    anchors.fill: parent
                                    anchors.leftMargin: 11
                                    anchors.rightMargin: 11
                                    anchors.topMargin: 7
                                    anchors.bottomMargin: 7
                                    Text {
                                        id: supertypeText1
                                        color: "#c5002a02"
                                        text: "Super Type"
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        anchors.leftMargin: 4
                                        anchors.rightMargin: 4
                                        anchors.topMargin: 4
                                        anchors.bottomMargin: 4
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                        z: 1
                                        minimumPointSize: 8
                                        minimumPixelSize: 8
                                        fontSizeMode: Text.Fit
                                        font.styleName: "Bold Italic"
                                        font.pointSize: 30
                                    }

                                    DropShadow {
                                        opacity: 0.8
                                        color: "#095f0c"
                                        radius: 3.8
                                        verticalOffset: 3
                                        samples: 16
                                        horizontalOffset: 3
                                    }

                                    Text {
                                        id: supertypeDropText1
                                        visible: false
                                        color: "#2a7b2d"
                                        text: supertypeText1.text
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        anchors.leftMargin: 6
                                        anchors.rightMargin: 2
                                        anchors.topMargin: 7
                                        anchors.bottomMargin: 1
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                        z: 0
                                        minimumPointSize: 8
                                        minimumPixelSize: 8
                                        fontSizeMode: Text.Fit
                                        font.styleName: "Bold Italic"
                                        font.pointSize: 30
                                    }

                                    Rectangle {
                                        id: rectangle38
                                        x: -8
                                        y: -4
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
                                    clip: true
                                }
                            }

                            Rectangle {
                                id: nameBlock1
                                width: 250
                                height: 70
                                color: "#c80d0d"
                                radius: 8
                                border.color: borderColor
                                border.width: 1
                                Rectangle {
                                    id: rectangle13
                                    color: "#b2b2b2"
                                    radius: 8
                                    border.color: "#616161"
                                    border.width: 2
                                    anchors.fill: parent
                                    anchors.leftMargin: 4
                                    anchors.rightMargin: 4
                                    anchors.topMargin: 3
                                    anchors.bottomMargin: 3
                                }

                                Rectangle {
                                    id: nameScreen1
                                    color: screenColor
                                    radius: 4
                                    border.color: "#128c17"
                                    border.width: 2
                                    anchors.fill: parent
                                    anchors.leftMargin: 11
                                    anchors.rightMargin: 11
                                    anchors.topMargin: 7
                                    anchors.bottomMargin: 7
                                    Text {
                                        id: nameText1
                                        color: "#c5002a02"
                                        text: (selectedIndex >= 0
                                               && selectedIndex < cards.length) ? cards[selectedIndex].name || "No Name Available" // Fallback if name is undefined
                                                                                : "Name"
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        anchors.leftMargin: 4
                                        anchors.rightMargin: 4
                                        anchors.topMargin: 4
                                        anchors.bottomMargin: 4
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                        z: 1
                                        minimumPointSize: 8
                                        minimumPixelSize: 8
                                        fontSizeMode: Text.Fit
                                        font.styleName: "Bold Italic"
                                        font.pointSize: 30
                                    }

                                    DropShadow {
                                        opacity: 0.8
                                        color: "#095f0c"
                                        radius: 3.8
                                        verticalOffset: 3
                                        samples: 16
                                        horizontalOffset: 3
                                    }

                                    Text {
                                        id: nameDropText1
                                        visible: false
                                        color: "#2a7b2d"
                                        text: nameText1.text
                                        anchors.left: parent.left
                                        anchors.right: parent.right
                                        anchors.top: parent.top
                                        anchors.bottom: parent.bottom
                                        anchors.leftMargin: 6
                                        anchors.rightMargin: 2
                                        anchors.topMargin: 7
                                        anchors.bottomMargin: 1
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                        z: 0
                                        minimumPointSize: 8
                                        minimumPixelSize: 8
                                        fontSizeMode: Text.Fit
                                        font.styleName: "Bold Italic"
                                        font.pointSize: 30
                                    }

                                    Rectangle {
                                        id: rectangle39
                                        x: -8
                                        y: -4
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
                                    clip: true
                                }
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Row {
                                id: typesRow1
                                width: 285
                                height: 106
                                spacing: 4
                                TypeBlock {
                                    id: typeBlock1
                                    width: 55
                                    height: 106
                                    color: "#ff0000"
                                    radius: 8
                                    border.color: borderColor
                                    border.width: 1
                                    anchors.verticalCenter: parent.verticalCenter
                                    type2Type: "Type 2"
                                    type1Type: "Type 1"
                                }

                                SubtypeBlock {
                                    id: subtypeBlock1
                                    width: 225
                                    height: 106
                                    color: window.blockBG
                                    radius: 6
                                    border.color: "#006c0101"
                                    border.width: 0
                                    anchors.verticalCenter: parent.verticalCenter
                                    sub4Text: "Subtype 4"
                                    sub3Text: "Subtype 3"
                                    sub2Text: "Subtype 2"
                                    sub1Text: "Subtype 1"
                                    blockBorderColor: "#6c0101"
                                }
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            FlavorTextBlock {
                                id: flavorTextBlock1
                                width: 250
                                height: 100
                                visible: true
                                screenShadeColor: window.screenShadeColor
                                screenHighlightColor: window.screenHighlightColor
                                screenColor: window.screenColor
                                descText: "Flavor Text"
                                blockBG: window.blockBG
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            SetLogoBlock {
                                id: setLogoBlock1
                                width: 240
                                height: 200
                                visible: true
                                color: "#c80d0d"
                                radius: 8
                                border.color: "#6c0101"
                                border.width: 2
                                logoSource: (selectedIndex >= 0 && selectedIndex < cards.length) ? cards[selectedIndex].setLogo : ""
                                logoScreenText: (selectedIndex >= 0
                                                 && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                                                  : "Set Logo"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Row {
                                id: setSymbolRow1
                                width: 208
                                height: 85
                                spacing: 3
                                SetSymbolBlock {
                                    id: setSymbolBlock1
                                    width: 85
                                    height: 85
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2
                                    imageSource: (selectedIndex >= 0
                                                  && selectedIndex < cards.length) ? cards[selectedIndex].setSymbol : ""
                                    blockText: (selectedIndex >= 0
                                                && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                                                 : "Set Symbol"
                                }

                                Rectangle {
                                    id: setBlock1
                                    width: 120
                                    height: 85
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2
                                    Rectangle {
                                        id: setNameBezel1
                                        color: "#b2b2b2"
                                        radius: 8
                                        border.color: "#6c0101"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: 4
                                        anchors.rightMargin: 4
                                        anchors.topMargin: 3
                                        anchors.bottomMargin: 3
                                        Rectangle {
                                            id: setNameScreen1
                                            x: 10
                                            y: 4
                                            color: screenColor
                                            radius: 6
                                            border.color: "#128c17"
                                            border.width: 2
                                            anchors.fill: parent
                                            anchors.leftMargin: 6
                                            anchors.rightMargin: 6
                                            anchors.topMargin: 4
                                            anchors.bottomMargin: 4
                                            Text {
                                                id: setNameText1
                                                color: "#c5002a02"
                                                text: (selectedIndex >= 0
                                                       && selectedIndex < cards.length) ? cards[selectedIndex].set || "No Name Available" // Fallback if name is undefined
                                                                                        : "Set Name"
                                                anchors.fill: parent
                                                anchors.leftMargin: 4
                                                anchors.rightMargin: 4
                                                anchors.topMargin: 4
                                                anchors.bottomMargin: 4
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                z: 1
                                                minimumPointSize: 6
                                                minimumPixelSize: 6
                                                fontSizeMode: Text.Fit
                                                font.styleName: "ExtraBold Italic"
                                                font.pointSize: 13
                                            }

                                            DropShadow {
                                                opacity: 0.8
                                                color: "#095f0c"
                                                radius: 3.8
                                                verticalOffset: 5
                                                samples: 16
                                                horizontalOffset: 5
                                            }

                                            Text {
                                                id: setNameDropText1
                                                color: "#095f0c"
                                                text: setNameText1.text
                                                anchors.fill: parent
                                                anchors.leftMargin: 4
                                                anchors.rightMargin: 4
                                                anchors.topMargin: 4
                                                anchors.bottomMargin: 4
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                z: 0
                                                minimumPointSize: 6
                                                minimumPixelSize: 6
                                                fontSizeMode: Text.Fit
                                                font.styleName: "ExtraBold Italic"
                                                font.pointSize: 13
                                            }

                                            Rectangle {
                                                id: rectangle40
                                                x: -7
                                                y: -4
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
                                            clip: true
                                        }
                                    }
                                }
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        contentWidth: 368
                        contentHeight: 1651
                    }
                    clip: true
                    anchors.verticalCenterOffset: 0
                }
            }
        }


        Rectangle {
            id: rectangle6
            width: 700
            height: 70
            opacity: 1
            color: "#00ffffff"
            border.color: "#6c0101"
            border.width: 2
            z: 1

            MySearchFilterTools {
                id: searchFilterTools
                width: 700
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.topMargin: 0
                //toolbarContentHeight: 30
                color: "#00ff0000"
                border.color: "#006c0101"
                border.width: 2
                blockBorderWidth: 3
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                typesRowSpacing: 14
                toolsBorderColor: "#ff0000"
                toolsFillColor: deepBG
                mainColor: "#790000"
                z: 2
                Layout.preferredWidth: 500

                // Dynamic ListModel for sets
                setsModel: ListModel {
                    id: setsModel
                }
            }
        }


        Rectangle {
            id: rectangle17
            width: 700
            height: 10
            color: "#ffffff"
            border.width: 0
            z: 1
            Rectangle {
                id: rectangle18
                y: -600
                color: "#ee0000"
                radius: 0
                border.color: "#cc1c1c"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                z: 0
                Rectangle {
                    id: rectangle103
                    color: deepBG
                    radius: 3
                    border.color: "#ee0000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                }
            }

            Rectangle {
                id: rectangle19
                color: "#00951111"
                radius: 0
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }

            Rectangle {
                id: rectangle20
                color: "#541515"
                radius: 2
                border.color: "#ee0000"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                z: 0
            }

            Rectangle {
                id: rectangle21
                y: 20
                color: "#00951111"
                radius: 2
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }
        }

        Rectangle {
            id: bottomToolbar
            width: 700
            height: 65
            color: "#ee0000"
            border.color: borderColor
            border.width: 2
            z: 1

            Rectangle {
                id: rectangle1
                color: "#541515"
                radius: 8
                border.color: "#ee0000"
                border.width: 1
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 4
            }

            ComboBox {
                id: setComboBox
                y: 8
                width: 300
                height: 25
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: toggleBothButton.right
                //anchors.left: parent.left
                //anchors.right: txtSearchBox.left
                anchors.leftMargin: 20
                z: 0
                Layout.leftMargin: 6
                Layout.preferredHeight: -1
                Layout.preferredWidth: -1
                //Layout.fillHeight: false
                //Layout.fillWidth: true
                displayText: "Sets"

                model: setsModel

                delegate: Item {
                    width: parent ? parent.width : 0
                    height: checkDelegate ? checkDelegate.height : 30

                    function toggle() {
                        checkDelegate.toggle()
                    }

                    CheckDelegate {
                        id: checkDelegate
                        anchors.fill: parent
                        text: model.name
                        highlighted: setComboBox.highlightedIndex == index
                        checked: model.selected
                        onCheckedChanged: {
                            if (model.selected !== checked) {
                                model.selected = checked;
                            }
                        }
                    }
                }

                // override space key handling to toggle items when the popup is visible
                Keys.onSpacePressed: {
                    console.log("Space Pressed")
                    if (setComboBox.popup.visible) {
                        var currentItem = setComboBox.popup.contentItem.currentItem
                        if (currentItem) {
                            currentItem.toggle()
                            event.accepted = true
                        }
                    }
                }

                Keys.onReleased: {
                    if (setComboBox.popup.visible)
                        event.accepted = (event.key === Qt.Key_Space)
                }

                Component.onCompleted: {
                    // Request All Sets to populate combo box
                    //console.log("Requesting sets from backend...")
                    backendController.request_sets_retrieve()
                }

                Rectangle {
                    id: rectangle
                    color: "#00ffffff"
                    radius: 8
                    border.color: "#ce0000"
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }
            }

            Connections {
                target: backendController

                function onSetsResults(response) {
                    var data = JSON.parse(response)
                    setsModel.clear(
                                ) // Clear existing items in the model

                    if (data.error) {
                        sets = [] // Clear the array of sets
                        console.log("Error in the data received from backend.")
                    } else {
                        // Collect sets into an array
                        var tempSets = []

                        data.forEach(function (set) {
                            // Collect each set object
                            tempSets.push({
                                              "name": set.name,
                                              "selected": false
                                          })
                        })

                        // Sort the array alphabetically by name
                        tempSets.sort(function (a, b) {
                            return a.name.localeCompare(
                                        b.name) // Sort using localeCompare for proper alphabetical order
                        })

                        // Append sorted sets to the model
                        tempSets.forEach(
                                    function (sortedSet) {
                                        setsModel.append(
                                                    sortedSet)
                                        //console.log("Appending set: ", sortedSet.name); // Debugging each appended set
                                    })

                        //console.log("SetsModel updated with new sets: ", setsModel.count); // Check the number of elements
                    }
                }
            }

            Button {
                id: btnDiscover
                y: 8
                width: 100
                height: 35
                text: qsTr("Discover")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: setComboBox.right
                anchors.leftMargin: 15
                anchors.verticalCenterOffset: 0
                //   anchors.right: parent.right
                //  anchors.rightMargin: -585
                z: 1
                font.styleName: "Bold Italic"
                // Layout.fillHeight: false
                // Layout.rightMargin: 6
                //Layout.fillWidth: false
                palette {
                    button: "blue"
                }

                Rectangle {
                    id: rectangle7
                    x: -304
                    y: -18
                    color: "#00ffffff"
                    radius: 8
                    border.color: "#ce0000"
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Discover a Pokemon")

                // Change scale when hovered
                scale: hovered ? 1.05 : 1.0

                onClicked: {
                    // Initialize an empty array for the search parameters
                    var searchParams = []

                    var setsParams = [];
                    // Collecting selected items from the ComboBox
                    for (var i = 0; i < setsModel.count; i++) {
                        var item = setsModel.get(i)
                        if (item.selected) {
                            // Build the tuple for each selected set item
                            setsParams.push(
                                        ['set', 'name', item.name])
                        }
                    }

                    if(setsParams.length === 0) {
                        for (var setIdx = 0; setIdx < setsModel.count; setIdx++) {
                            var setItem = setsModel.get(setIdx)
                            setsParams.push(
                                        ['set', 'name', setItem.name])

                        }
                    }

                    var typesParams = [];
                    // Check the state of each Pokémon TCG type button and add to search parameters if checked
                    if (searchFilterTools.fireChecked) {
                        typesParams.push(
                                    ['types', '', 'fire'])
                    }
                    if (searchFilterTools.waterChecked) {
                        typesParams.push(
                                    ['types', '', 'water'])
                    }
                    if (searchFilterTools.grassChecked) {
                        typesParams.push(
                                    ['types', '', 'grass'])
                    }
                    if (searchFilterTools.lightningChecked) {
                        typesParams.push(
                                    ['types', '', 'lightning'])
                    }
                    if (searchFilterTools.psychicChecked) {
                        typesParams.push(
                                    ['types', '', 'psychic'])
                    }
                    if (searchFilterTools.fightingChecked) {
                        typesParams.push(
                                    ['types', '', 'fighting'])
                    }
                    if (searchFilterTools.darknessChecked) {
                        typesParams.push(
                                    ['types', '', 'darkness'])
                    }
                    if (searchFilterTools.fairyChecked) {
                        typesParams.push(
                                    ['types', '', 'fairy'])
                    }
                    if (searchFilterTools.dragonChecked) {
                        typesParams.push(
                                    ['types', '', 'dragon'])
                    }
                    if (searchFilterTools.metalChecked) {
                        typesParams.push(
                                    ['types', '', 'metal'])
                    }
                    if (searchFilterTools.colorlessChecked) {
                        typesParams.push(
                                    ['types', '', 'colorless'])
                    }

                    if(typesParams.length === 0) {
                        typesParams.push(['types', '', 'fire']);
                        typesParams.push(['types', '', 'grass']);
                        typesParams.push(['types', '', 'water']);
                        typesParams.push(['types', '', 'lightning']);
                        typesParams.push(['types', '', 'fighting']);
                        typesParams.push(['types', '', 'psychic']);
                        typesParams.push(['types', '', 'darkness']);
                        typesParams.push(['types', '', 'metal']);
                        typesParams.push(['types', '', 'fairy']);
                        typesParams.push(['types', '', 'dragon']);
                        typesParams.push(['types', '', 'colorless']);
                    }

                    // console.log(setsParams);
                    // console.log(typesParams)

                    searchParams = searchParams.concat(typesParams);
                    searchParams = searchParams.concat(setsParams);

                    //console.log(searchParams)


                    // Call the request_search function with the built tuples if there are any
                    if (searchParams.length > 0) {
                        //Print each tuple as a string to the console
                        for (var paramIndex = 0; paramIndex < searchParams.length; paramIndex++) {
                            var tupleString = "[" + searchParams[paramIndex][0] + ", "
                                    + searchParams[paramIndex][1] + ", "
                                    + searchParams[paramIndex][2] + "]"
                        }
                        backendController.request_discover(
                                    searchParams)
                        // resetLeftColumnScroll()
                        // resetRightColumnScroll()
                    }
                }

                Connections {
                    target: btnDiscover
                    function onPressed() {
                        rectangle7.border.color = pressedToggleColor;
                    }
                }

                Connections {
                    target: btnDiscover
                    function onReleased(){
                        rectangle7.border.color = releasedToggleColor;
                    }
                }
            }

            Image {
                id: ballToggleImage
                x: 85
                width: 100
                height: 100
                opacity: 1
                anchors.verticalCenter: parent.verticalCenter
                source: "newBall.png"
                z: 1
                scale: 0.45
                fillMode: Image.PreserveAspectFit
            }

            Timer {
                id: toggleLockTimer
                interval: lockTimerDuration
                repeat: false
                onTriggered: {
                    // console.log("Toggle Timer Triggered");
                    // toggleBothButton.enabled = true;
                    // toggleBothButton.hoverEnabled = true;

                }
            }

            RoundButton {
                id: toggleBothButton
                x: 115
                width: 40
                height: 40
                opacity: 1
                text: ""
                anchors.verticalCenter: parent.verticalCenter
                enabled: !toggleLockTimer.running
                //enabled: !toggleLockTimer.running
                highlighted: false
                flat: false
                hoverEnabled: true

                ToolTip.delay: 800
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Toggle both drawers.")

                MouseArea {
                    visible: false
                    anchors.fill: parent
                    enabled: true
                    preventStealing: false
                    propagateComposedEvents: false
                    hoverEnabled: false
                    cursorShape: Qt.PointingHandCursor
                    drag.target: toggleBothButton
                    onEntered: ballToggleImage.scale = 0.40;
                    onExited: ballToggleImage.scale = 0.35;
                }

                Connections {
                    target: toggleBothButton
                    function onClicked() {
                        // console.log("clicked")

                    }

                }

                Connections {
                    target: toggleBothButton
                    function onPressed() {
                        // console.log("pressed")
                        //ballToggleImage.opacity = 0.5;
                        toggleButtonHighlight.border.color = pressedToggleColor;
                    }
                }

                Connections {
                    target: toggleBothButton


                    function onReleased(){
                        console.log("released")

                        // ballToggleImage.opacity = 1;

                        if(isDrawerOpen &! isDrawer2Open) {
                            toggleRightDrawer();
                        }
                        else if(isDrawer2Open &! isDrawerOpen) {
                            toggleLeftDrawer();
                        }
                        else {
                            toggleBothDrawers()

                        }


                        toggleButtonHighlight.border.color = releasedToggleColor;
                    }
                }

                Rectangle {
                    id: toggleButtonHighlight
                    x: -539
                    y: -557
                    color: "#00ffffff"
                    radius: 20
                    border.color: "#ff0000"
                    border.width: 30
                    anchors.fill: parent
                    anchors.leftMargin: -4
                    anchors.rightMargin: -4
                    anchors.topMargin: -4
                    anchors.bottomMargin: -4
                }
            }

            Rectangle {
                id: settingsButtonHighlight
                x: 605
                width: 80
                height: 50
                visible: true
                color: "#c80d0d"
                radius: 3
                border.color: primaryColor
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                z: 0
                Button {
                    id: btnSettings
                    x: -4
                    y: 2
                    text: ""
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 4
                    anchors.topMargin: 3
                    anchors.bottomMargin: 4
                    z: 0
                    verticalPadding: 0
                    padding: 0

                    // hoverEnabled: true;
                    ToolTip.timeout: 5000
                    ToolTip.delay: 800
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Search Settings")

                    onReleased: {
                        settingsButtonHighlight.border.color = primaryColor;
                        settingsButtonHighlight.color = primaryColor;

                    }
                    onPressed: {
                        settingsButtonHighlight.border.color = screenColor;
                        settingsButtonHighlight.color = screenColor;
                    }
                    onClicked: {
                        // setComboBox.clearParams();
                        //console.log("Calling signal clearParams()");
                        settingsWindow.visible = true;
                    }
                    horizontalPadding: 0

                    Image {
                        id: settingsButtonImage
                        y: -59
                        width: 176
                        height: 210
                        source: "https://images.pokemontcg.io/swsh2/168_hires.png"
                        sourceSize.width: 150
                        sourceSize.height: 209
                        scale: 0.52
                        fillMode: Image.PreserveAspectCrop
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    clip: true
                    // activeFocusOnTab: false


                }
                anchors.verticalCenterOffset: 0
            }

            Rectangle {
                id: clearButtonHighlight
                x: 15
                width: 80
                height: 50
                visible: true
                color: "#c80d0d"
                radius: 3
                border.color: primaryColor
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenterOffset: -1
                z: 0
                Button {
                    id: btnClear
                    x: -4
                    y: 2
                    text: ""
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 4
                    anchors.topMargin: 3
                    anchors.bottomMargin: 4
                    z: 0
                    verticalPadding: 0
                    padding: 0
                    onReleased: {
                        clearButtonHighlight.border.color = primaryColor;
                        clearButtonHighlight.color = primaryColor;

                    }
                    onPressed: {
                        clearButtonHighlight.border.color = screenColor;
                        clearButtonHighlight.color = screenColor;
                    }
                    onClicked: {
                        // setComboBox.clearParams();
                        //console.log("Calling signal clearParams()");
                        clearParams();

                    }
                    horizontalPadding: 0
                    Image {
                        id: image
                        y: -52
                        width: 176
                        height: 210
                        source: "https://images.pokemontcg.io/swsh35/51_hires.png"
                        sourceSize.width: 150
                        sourceSize.height: 209
                        scale: 0.6
                        fillMode: Image.PreserveAspectCrop
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    clip: true
                    activeFocusOnTab: false
                    ToolTip.timeout: 5000
                    ToolTip.delay: 800
                }
            }
        }

        Rectangle {
            id: rectangle22
            width: 700
            height: 10
            color: "#ffffff"
            border.width: 0
            z: 1
            Rectangle {
                id: rectangle23
                y: -600
                color: "#ee0000"
                radius: 0
                border.color: "#cc1c1c"
                border.width: 2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                z: 0
                Rectangle {
                    id: rectangle104
                    color: deepBG
                    radius: 3
                    border.color: "#ee0000"
                    border.width: 1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                }
            }

            Rectangle {
                id: rectangle24
                color: "#00951111"
                radius: 0
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }

            Rectangle {
                id: rectangle25
                color: "#541515"
                radius: 2
                border.color: "#ee0000"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                anchors.rightMargin: 3
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                z: 0
            }

            Rectangle {
                id: rectangle26
                y: 20
                color: "#00951111"
                radius: 2
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                z: 0
            }
        }
    }

    Connections {
        target: backendController
        function onDiscoverResults(response) {

            var data = JSON.parse(response)

            if (data.error) {
                console.log("Error in response:",
                            data.error) // Log the error message
                cards = []
            } else {
                cards = data.map(card => ({
                                              "name": card.name,
                                              "id": card.id,
                                              "supertype": card.supertype,
                                              "type1": card.type1,
                                              "type2": card.type2,

                                              // Card Scan Image Hi-Res
                                              "imageUrl": card.imageUrl
                                                          || "",

                                              "set": card.set,
                                              "setSymbol": card.setSymbol,
                                              "setLogo": card.setLogo,

                                              "flavorText": card.flavorText,

                                              "rule1": card.rule1,
                                              "rule2": card.rule2,
                                              "rule3": card.rule3,
                                              "rule4": card.rule4,

                                              // Ability 1
                                              "ability1Name": card.ability1Name || "",
                                              "ability1Text": card.ability1Text || "",
                                              "ability1Type": card.ability1Type || "",

                                              // Ability 2
                                              "ability2Name": card.ability2Name || "",
                                              "ability2Text": card.ability2Text || "",
                                              "ability2Type": card.ability2Type || "",

                                              // Attack 1
                                              "attack1Name": card.attack1Name || "",
                                              "attack1Text": card.attack1Text || "",
                                              "attack1Damage": card.attack1Damage || "",
                                              "attack1ConvertedEnergyCost": card.attack1ConvertedEnergyCost || 0,
                                              "attack1Cost1": card.attack1Cost1 || "Cost 1",
                                              "attack1Cost2": card.attack1Cost2 || "Cost 2",
                                              "attack1Cost3": card.attack1Cost3 || "Cost 3",
                                              "attack1Cost4": card.attack1Cost4 || "Cost 4",
                                              "attack1Cost5": card.attack1Cost5 || "Cost 5",

                                              // Attack 2
                                              "attack2Name": card.attack2Name || "",
                                              "attack2Text": card.attack2Text || "",
                                              "attack2Damage": card.attack2Damage || "",
                                              "attack2ConvertedEnergyCost": card.attack2ConvertedEnergyCost || 0,
                                              "attack2Cost1": card.attack2Cost1 || "Cost 1",
                                              "attack2Cost2": card.attack2Cost2 || "Cost 2",
                                              "attack2Cost3": card.attack2Cost3 || "Cost 3",
                                              "attack2Cost4": card.attack2Cost4 || "Cost 4",
                                              "attack2Cost5": card.attack2Cost5 || "",

                                              // Attack 3
                                              "attack3Name": card.attack3Name || "",
                                              "attack3Text": card.attack3Text || "",
                                              "attack3Damage": card.attack3Damage || "",
                                              "attack3ConvertedEnergyCost": card.attack3ConvertedEnergyCost || 0,
                                              "attack3Cost1": card.attack3Cost1 || "Cost 1",
                                              "attack3Cost2": card.attack3Cost2 || "Cost 2",
                                              "attack3Cost3": card.attack3Cost3 || "Cost 3",
                                              "attack3Cost4": card.attack3Cost4 || "Cost 4",
                                              "attack3Cost5": card.attack3Cost5 || "",

                                              // Attack 4
                                              "attack4Name": card.attack4Name || "",
                                              "attack4Text": card.attack4Text || "",
                                              "attack4Damage": card.attack4Damage || "",
                                              "attack4ConvertedEnergyCost": card.attack4ConvertedEnergyCost || 0,
                                              "attack4Cost1": card.attack4Cost1 || "Cost 1",
                                              "attack4Cost2": card.attack4Cost2 || "Cost 2",
                                              "attack4Cost3": card.attack4Cost3 || "Cost 3",
                                              "attack4Cost4": card.attack4Cost4 || "Cost 4",
                                              "attack4Cost5": card.attack4Cost5 || "",

                                              // Subtypes
                                              "subtype1" : card.subtype1 || "",
                                              "subtype2": card.subtype2 || "",
                                              "subtype3": card.subtype3 || "",
                                              "subtype4": card.subtype4 || ""
                                          }))

                selectedIndex = 0; // Start with the first card
                updateAttackInfo();
                updateAbilityInfo();
                updateSubTypeInfo();
                updateSuperTypeInfo();
                updateTypeInfo();
                updateFlavorText();
                resetLeftColumnScroll();
                resetRightColumnScroll();
                view.visible = true
            }
        }
    }

    Rectangle {
        id: rectangle14
        color: blockBG
        anchors.fill: parent
        z: 0
        border.color: borderColor
        border.width: 0
    }

    Item {
        id: __materialLibrary__
    }
    // Page content for browsePage

    SettingsWindow {
        id: settingsWindow
        color: bezelColor
        flags: Qt.SubWindow
        height: 200
        maximumHeight: settingsWindow.height
        maximumWidth: settingsWindow.width
        minimumHeight: settingsWindow.height
        minimumWidth: settingsWindow.width
        modality: Qt.WindowModal
        visible: false
        width: 400
    }

}






/*##^##
Designer {
    D{i:0}D{i:41;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:57}D{i:76}D{i:125}D{i:127}
D{i:136}
}
##^##*/
