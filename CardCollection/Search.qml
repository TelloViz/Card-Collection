import QtQuick 2.13
import QtQuick.Controls 2.2
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects
import QtQuick3D


// Page 1: Search Page
Item {
    id: searchPage
    width: 700
    height: 615
    visible: true
    Layout.preferredHeight: 560
    Layout.preferredWidth: 600
    Layout.fillHeight: false
    Layout.fillWidth: false

    property bool counterVisible: false

    property int selectedIndex: 0
    property var cards: [] // List of card objects
    property var cachedSets: [] // List to hold set names
    //property int selectedTabIndex: 0

    // Define color scheme properties
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
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

    function toggleDrawer() {
        if (customDrawer.x < 0) {

            customDrawer.x = 8
            isDrawerOpen = true

            // Animate ball button rotation on drawer open
            rotateAnimation.from = ballButton.rotation
            rotateAnimation.to = 270 // Rotate by 90 degrees
            rotateAnimation.start()
        } else {

            customDrawer.x = -customDrawer.width + 6 // hide drawer
            isDrawerOpen = false

            // Animate rotation on drawer close
            rotateAnimation.from = ballButton.rotation
            rotateAnimation.to = 90 // Reset to 0 degrees rotation
            rotateAnimation.start()
        }
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
            subtypeBlock.sub1Text = cards[selectedIndex].subtype1
                    || "Sub Type 1"
            subtypeBlock.sub2Text = cards[selectedIndex].subtype2
                    || "Sub Type 2"
            subtypeBlock.sub3Text = cards[selectedIndex].subtype3
                    || "Sub Type 3"
            subtypeBlock.sub4Text = cards[selectedIndex].subtype4
                    || "Sub Type 4"

            subtypeBlock.updateSubTypeInfo();

            if(!subtypeBlock.visible && !typeBlock.visible) {
                typesRow.height = 0;
            }
            else {
                typesRow.height = 106;
            }
        }

    }

    function updateSuperTypeInfo() {
        if(cards[selectedIndex]) {
            supertypeText.text = cards[selectedIndex].supertype
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
            typeBlock.type1Type = defaultType1;
            typeBlock.type2Type= defaultType2;
            return; // Exit early if no card is found
        }
        else {
            //  console.log(cards[selectedIndex].type1)
        }

        // Normalize type strings for image source mapping
        const normalizedType1 = cards[selectedIndex]?.type1?.trim().toLowerCase() || "";
        const normalizedType2 = cards[selectedIndex]?.type2?.trim().toLowerCase() || "";

        typeBlock.type1Type = normalizedType1 || defaultType1;
        typeBlock.type2Type = normalizedType2 || defaultType2;

        if(typeBlock.type1Type === defaultType1 && typeBlock.type2Type === defaultType2) {

            typeBlock.visible = false;
        }
        else {
            typeBlock.visible = true;
        }

        if(typeBlock.visible && subtypeBlock.visible) {

            // typesRow.width = typeBlock.width + subtypeBlock.width

        } else if (typeBlock.visible && !subtypeBlock.visible) {

            // typesRow.width = typeBlock.width

        } else if (!typeBlock.visible && subtypeBlock.visible) {
            // typesRow.width = subtypeBlock.width
        }


    }

    function updateFlavorText() {
        if(cards[selectedIndex] && cards[selectedIndex].flavorText !== "") {
            // console.log();
            flavorTextBlock.descText = cards[selectedIndex].flavorText;
            rule1TextBlock.descText = cards[selectedIndex].rule1;
            rule2TextBlock.descText = cards[selectedIndex].rule2;
            rule3TextBlock.descText = cards[selectedIndex].rule3;
            rule4TextBlock.descText = cards[selectedIndex].rule4;

            flavorTextBlock.visible = flavorTextBlock.descText !== "" && flavorTextBlock.descText !== "Flavor Text"
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

        rightScrollView.contentHeight = rightContentHeight + 55; // Set the final content height
    }



    function resetCardRotation() {
        momentumTimer.stop()
        cardNode.eulerRotation.y = 0;
    }
    function resetLeftColumnScroll() {
        leftScrollView.contentX = 0;
        leftScrollView.contentY = 0;
    }

    function resetRightColumnScroll() {
        rightScrollView.contentX = 0;
        rightScrollView.contentY = 0;
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
            updateRightScrollView();
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
            updateLeftScrollView();
            updateRightScrollView();
        }
    }

    Column {
        id: searchTabColumn
        anchors.fill: parent
        spacing: 0

        Column {
            id: searchToolsColumn
            width: 700
            height: 100
            Layout.preferredWidth: 600
            Layout.preferredHeight: 80
            spacing: 0
            Layout.columnSpan: 1
            z: 0
            Layout.fillWidth: true
            Layout.fillHeight: false

            MySearchFilterTools {
                id: searchFilterTools
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.topMargin: 0
                //toolbarContentHeight: 30
                height: 60
                color: "#00000000"
                radius: 0
                border.color: "#ff0000"
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                typesRowSpacing: 14
                borderColor: "#ff0000"
                blockBorderWidth: 2
                z: 2
                Layout.preferredWidth: 500
                toolsBorderColor: "#ff0000"
                toolsFillColor: "#00541515"

                // Dynamic ListModel for sets
                setsModel: ListModel {
                    id: setsModel
                }

                Rectangle {
                    id: rectangle4
                    color: "#00ffffff"
                    radius: 8
                    border.color: "#ff0000"
                    border.width: 3
                    anchors.fill: parent
                    z: -1
                }

                Rectangle {
                    id: rectangle5
                    color: "#541515"
                    radius: 0
                    border.color: "#00ff0000"
                    border.width: 0
                    anchors.fill: parent
                    z: -2
                }
            }

            ToolBar {
                id: searchTools
                width: 700
                height: 40
                Layout.preferredHeight: 40
                Layout.preferredWidth: 600
                Layout.fillHeight: false
                Layout.fillWidth: true

                Row {
                    id: searchRow
                    x: 0
                    width: 700
                    anchors.verticalCenter: parent.verticalCenter
                    z: 1
                    spacing: 5


                    ComboBox {
                        id: setComboBox
                        width: 260
                        height: 25
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 2
                        anchors.rightMargin: 6
                        Layout.leftMargin: 6
                        Layout.preferredHeight: -1
                        Layout.preferredWidth: -1
                        displayText: "Sets"

                        model: setsModel

                        function handleSpacePressed(event) {
                            console.log("Space pressed");
                            if (setComboBox.popup.visible) {
                                console.log("setComboBox.popup is visible");
                                console.log("Highlighted index: " + setComboBox.highlightedIndex);
                                if (setComboBox.highlightedIndex >= 0) {
                                    var item = setsModel.get(setComboBox.highlightedIndex);
                                    item.selected = !item.selected;  // Toggle the selected state
                                    event.accepted = true;
                                }
                            }
                        }

                        Keys.onSpacePressed: handleSpacePressed

                        signal clearSignal;

                        Connections {
                            target: btnClear
                            function onClearParams() {
                                //console.log("Signal onClearParams() called");

                                // Clear all items in setsModel
                                setsModel.clear();

                                // Create a temporary list to hold the items
                                var tempList = [];
                                for(var i = 0; i < cachedSets.length; i++) {
                                    setsModel.append(cachedSets[i]);
                                    //console.log(cachedSets[i].name);
                                }

                                // Reset filter states
                                searchFilterTools.fireChecked = false;
                                searchFilterTools.waterChecked = false;
                                searchFilterTools.grassChecked = false;
                                searchFilterTools.lightningChecked = false;
                                searchFilterTools.psychicChecked = false;
                                searchFilterTools.fightingChecked = false;
                                searchFilterTools.darknessChecked = false;
                                searchFilterTools.fairyChecked = false;
                                searchFilterTools.dragonChecked = false;
                                searchFilterTools.metalChecked = false;
                                searchFilterTools.colorlessChecked = false;

                                // Clear search box text
                                txtSearchBox.text = "";
                            }
                        }


                        delegate: Item {
                            id: itemDelegate
                            width: parent ? parent.width : 0
                            height: checkDelegate ? checkDelegate.height : 30


                            Connections {
                                target: setComboBox
                                function onClearSignal() {
                                    // console.log("onClearSignal called");
                                    toggle();
                                }

                            }

                            function toggle() {
                                // console.log("itemDelegate.toggle() called...");
                                checkDelegate.toggle()
                            }

                            MouseArea {
                                id: comboBoxDelegateMouseArea
                                anchors.fill: parent
                                onClicked: checkDelegate.checked = !checkDelegate.checked
                                onEntered: setComboBox.highlightedIndex = index  // Manually set the highlighted index
                            }

                            CheckDelegate {
                                id: checkDelegate
                                anchors.fill: parent
                                text: model.name
                                highlighted: setComboBox.highlightedIndex == index
                                checked: model.selected
                                onCheckedChanged: {
                                    model.selected = checked;
                                }
                            }
                        }

                        Component.onCompleted: {
                            // Request All Sets to populate combo box
                            backendController.request_sets_retrieve()
                            forceActiveFocus()
                        }

                        Connections {
                            target: backendController

                            function onSetsResults(response) {
                                var data = JSON.parse(response)
                                setsModel.clear() // Clear existing items in the model

                                if (data.error) {
                                    console.log("Error in the data received from backend.")
                                } else {
                                    var tempSets = []
                                    data.forEach(function (set) {
                                        tempSets.push({
                                                          "name": set.name,
                                                          "selected": false
                                                      })
                                    })

                                    tempSets.sort(function (a, b) {
                                        return a.name.localeCompare(b.name)
                                    })

                                    tempSets.forEach(function (sortedSet) {
                                        setsModel.append(sortedSet);
                                    })

                                    cachedSets = [];
                                    cachedSets = tempSets;
                                }
                            }


                        }
                    }
                    TextField {
                        id: txtSearchBox
                        x: 111
                        width: 282
                        height: 25
                        text: "Deoxys"
                        anchors.verticalCenter: parent.verticalCenter
                        z: 1
                        Layout.preferredHeight: 25
                        Layout.preferredWidth: 200
                        placeholderText: qsTr("Enter card name")
                        //Layout.fillWidth: true

                        Rectangle {
                            id: rectangle7
                            color: "#00951111"
                            radius: 4
                            border.color: "#6c0101"
                            border.width: 2
                            anchors.fill: parent
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            clip: false
                            scale: 1
                            z: 0
                        }
                    }

                    Button {
                        id: btnSearch
                        x: 485
                        width: 135
                        height: 25
                        text: qsTr("Search")
                        anchors.verticalCenter: parent.verticalCenter
                        z: 1
                        font.styleName: "Bold Italic"
                        palette {
                            button: "blue"
                        }
                        hoverEnabled: true

                        ToolTip.delay: 800
                        ToolTip.timeout: 5000
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Search the database with the selected filters")

                        // Change scale when hovered
                        scale: hovered ? 1.05 : 1.0

                        onClicked: {
                            // Initialize an empty array for the search parameters
                            var searchParams = []

                            var nameParam = []

                            // Check if the search box is not empty
                            if (txtSearchBox.text.trim() !== "") {
                                // Create a tuple with the entered name
                                nameParam.push(
                                            ['', 'name', txtSearchBox.text])
                            }

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
                                    //console.log(setsParams[setIdx]);

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

                            // if(typesParams.length === 0) {
                            //     typesParams.push(['types', '', 'fire']);
                            //     typesParams.push(['types', '', 'grass']);
                            //     typesParams.push(['types', '', 'water']);
                            //     typesParams.push(['types', '', 'lightning']);
                            //     typesParams.push(['types', '', 'fighting']);
                            //     typesParams.push(['types', '', 'psychic']);
                            //     typesParams.push(['types', '', 'darkness']);
                            //     typesParams.push(['types', '', 'metal']);
                            //     typesParams.push(['types', '', 'fairy']);
                            //     typesParams.push(['types', '', 'dragon']);
                            //     typesParams.push(['types', '', 'colorless']);
                            // }

                            searchParams = searchParams.concat(typesParams);
                            searchParams = searchParams.concat(setsParams);

                            if(nameParam.length !== 0) {
                                searchParams = searchParams.concat(nameParam);
                            }

                            // Call the request_search function with the built tuples if there are any
                            if (searchParams.length > 0) {
                                //Print each tuple as a string to the console
                                for (var paramIndex = 0; paramIndex < searchParams.length; paramIndex++) {
                                    var tupleString = "[" + searchParams[paramIndex][0] + ", "
                                            + searchParams[paramIndex][1] + ", "
                                            + searchParams[paramIndex][2] + "]"
                                }
                                backendController.request_search(
                                            searchParams)
                                resetLeftColumnScroll()
                            }
                        }
                    }
                }

                Rectangle {
                    id: pitShadowBorder
                    color: "#00ffffff"
                    radius: 4
                    border.color: "#6c0101"
                    border.width: 2
                    anchors.fill: parent
                    anchors.leftMargin: -6
                    anchors.rightMargin: -6
                    z: 1

                    Rectangle {
                        id: highlightBorder
                        width: 700
                        height: 40
                        color: "#00ffffff"
                        radius: 4
                        border.color: "#ee0000"
                        border.width: 1
                        z: 1
                    }
                }

                Rectangle {
                    id: bgRect
                    color: "#cc1c1c"
                    border.color: "#00000000"
                    anchors.fill: parent
                    anchors.leftMargin: -6
                    anchors.rightMargin: -6
                }
            }
        }

        Item {
            id: _item
            width: 700
            height: 425
            Layout.preferredWidth: 200
            Layout.preferredHeight: 470
            Layout.margins: 0
            Layout.fillHeight: false
            Layout.fillWidth: true


            // The main Pane with no margin or padding
            Rectangle {
                id: _itemOuterRedMid
                visible: true
                color: "#00ccf2ff"
                radius: 0
                border.color: "#cc1c1c"
                border.width: 6
                anchors.fill: parent
                z: 3
            }

            Rectangle {
                id: _itemOuterRedShade
                height: 404
                visible: true
                color: "#00ccf2ff"
                radius: 4
                border.color: "#6c0101"
                border.width: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.topMargin: 0
                z: 4
            }

            Rectangle {
                id: _itemOuterRedShade1
                visible: true
                color: "#00ccf2ff"
                radius: 4
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                z: 4
            }

            Pane {
                id: viewPane
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                topPadding: 0
                rightPadding: 0
                leftPadding: 0
                verticalPadding: 6 // Padding inside the pane
                horizontalPadding: 6 // Padding inside the pane
                contentWidth: 468
                contentHeight: 300
                bottomPadding: 0
                Layout.margins: 0 // No margins for the pane
                Layout.fillHeight: true
                Layout.fillWidth: true

                // Border Rectangle around the Pane
                Rectangle {
                    visible: true
                    anchors.fill: parent
                    anchors.leftMargin: -8
                    anchors.rightMargin: 8
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    z: 0
                    color: dataFlow.color // Set background to transparent
                    border.color: "#00255864" // Darker grey color for the border
                    border.width: 0
                    radius: 0 // Optional: Set radius for rounded corners
                }

                // Drawer
                Rectangle {
                    id: customDrawer
                    x: -330
                    width: 330
                    height: 415
                    opacity: 1
                    visible: true
                    // Start hidden
                    color: screenColor
                    radius: 4
                    border.color: "#25fb2e"
                    border.width: 6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 0
                    clip: true
                    scale: 1
                    z: 1

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

                    // Frame that holds the card images on both sides
                    Frame {
                        id: frame
                        visible: true
                        anchors.fill: parent

                        View3D {
                            id: view
                            anchors.fill: parent
                            clip: false
                            z: 3
                            visible: false

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
                                anchors.fill: parent
                                anchors.leftMargin: 0
                                anchors.rightMargin: 0
                                anchors.topMargin: 0
                                anchors.bottomMargin: 0
                                property real previousX: 0
                                property real velocityY: 0
                                property real dragSensitivity: 0.2
                                property real momentumDecay: 0.98 // Controls how quickly momentum fades

                                onPressed: {
                                    previousX = mouse.x
                                    velocityY = 0
                                    momentumTimer.stop()
                                }

                                onPositionChanged: {
                                    var deltaX = mouse.x - previousX
                                    velocityY = deltaX * dragSensitivity
                                    cardNode.eulerRotation.y += velocityY
                                    previousX = mouse.x
                                }

                                onReleased: {
                                    momentumTimer.start()
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
                    }

                    Rectangle {
                        id: rectangle1
                        x: -290
                        width: 300
                        height: 438
                        visible: true
                        color: "#00ffffff"
                        radius: 3
                        border.color: "#128c17"
                        border.width: 4
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                // Trigger button to open/close drawer
                MouseArea {
                    id: openButton
                    width: 28 // Width of the button
                    height: parent.height
                    opacity: 1
                    anchors.verticalCenter: customDrawer.verticalCenter
                    anchors.left: customDrawer.right // Keep the button attached to the right edge of the drawer
                    anchors.leftMargin: -1

                    cursorShape: Qt.PointingHandCursor // Change cursor to hand when hovering

                    z: 1
                    hoverEnabled: true
                    onEntered: {
                        // Scale up on hover
                        ballButton.scale = 0.7
                    }
                    onExited: {
                        // Scale down when not hovered
                        ballButton.scale = 0.6
                    }
                    onClicked: {
                        toggleDrawer();
                    }

                    // Background of the button
                    Rectangle {
                        id: buttonBackground
                        anchors.fill: parent
                        color: "#ee1414" // Background color of the button
                        radius: 0 // Rounded corners
                        border.color: "#620808" // Darker border for a subtle effect
                        border.width: 2
                        MouseArea {
                            onClicked: {
                                toggleDrawer();
                            }
                        }


                        Rectangle {
                            id: rectangle29
                            color: "#00ffffff"
                            radius: 3
                            border.color: "#ee0000"
                            border.width: 2
                            anchors.fill: parent
                            anchors.leftMargin: 5
                            anchors.rightMargin: 5
                            anchors.topMargin: 10
                            anchors.bottomMargin: 10
                        } // Thin border
                    }

                    // Circle for the caret background
                    Rectangle {
                        id: drawerCircle
                        x: 8
                        width: 26
                        height: 26
                        visible: false
                        color: "#6c0101" // Circle color
                        radius: 9
                        border.color: "#c80d0d"
                        border.width: 2
                        anchors.verticalCenter: parent.verticalCenter // Make it a circle
                        anchors.right: parent.right
                        anchors.rightMargin: -10
                        // Position the circle on the right side of the button

                        // Smooth scaling animation
                        Behavior on scale {
                            NumberAnimation {
                                duration: 200
                                // easing: Easing.InOutQuad
                            }
                        }

                        // MouseArea to detect hover events
                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor // Change cursor to hand when hovering

                            onEntered: {
                                // Scale up on hover
                                drawerCircle.scale = 1.2
                            }
                            onExited: {
                                // Scale down when not hovered
                                drawerCircle.scale = 1
                            }

                            onClicked: {
                                toggleDrawer();
                            }
                        }
                    }


                    Image {
                        id: ballButton
                        x: -4
                        width: 60
                        height: 60
                        anchors.verticalCenter: parent.verticalCenter
                        source: "newBall.png"
                        anchors.verticalCenterOffset: 0
                        scale: 0.6
                        mirror: false
                        sourceSize.height: 50
                        autoTransform: false
                        mipmap: false
                        fillMode: Image.Stretch
                        rotation: 90 // Start with no rotation

                        // Rotation animation
                        NumberAnimation {
                            id: rotateAnimation
                            target: ballButton
                            property: "rotation"
                            duration: 500 // Duration of the rotation (in milliseconds)
                        }

                        // MouseArea to detect hover events
                        MouseArea {
                            id: ballMouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor // Change cursor to hand when hovering

                            onEntered: {
                                // Scale up on hover
                                ballButton.scale = 0.7
                            }
                            onExited: {
                                // Scale down when not hovered
                                ballButton.scale = 0.6
                            }

                            onClicked: {
                                toggleDrawer();
                            }
                        }
                    }
                }

                // Define the animation
                PropertyAnimation {
                    id: drawerAnimation
                    target: customDrawer
                    property: "x"
                    alwaysRunToEnd: false
                    running: false
                    duration: 200  // Duration of the animation in milliseconds
                    easing.type: Easing.InOutQuad  // Easing function for smoothness
                }

                Rectangle {
                    id: dataFlow
                    opacity: 1
                    visible: true
                    color: "#541515"
                    border.width: 0
                    anchors.fill: parent
                    anchors.leftMargin: 35
                    anchors.rightMargin: 6
                    anchors.topMargin: 5
                    anchors.bottomMargin: 6
                    clip: true


                    Flickable {
                        id: leftScrollView
                        width: 290
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.leftMargin: 15
                        anchors.topMargin: 4
                        anchors.bottomMargin: 4
                        contentWidth: 250
                        clip: false
                        boundsBehavior: Flickable.DragOverBounds
                        boundsMovement: Flickable.FollowBoundsBehavior
                        flickableDirection: Flickable.VerticalFlick
                        contentHeight: 506 // Set a suitable height for your content

                        // First attack
                        Column {
                            id: leftSideColumn
                            x: 5
                            y: 0
                            width: 283
                            height: 446
                            // anchors.verticalCenter: parent.verticalCenter
                            // anchors.verticalCenterOffset: -16
                            spacing: 4

                            FlavorTextBlock {
                                id: rule1TextBlock

                                blockBG: window.blockBG
                                screenColor: window.screenColor
                                screenShadeColor: window.screenShadeColor
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                                screenHighlightColor: window.screenHighlightColor

                                width: 290
                                height: 100
                                //  anchors.top: parent.top

                                descText: "Rule 1"
                            }

                            FlavorTextBlock {
                                id: rule2TextBlock

                                blockBG: window.blockBG
                                screenColor: window.screenColor
                                screenShadeColor: window.screenShadeColor
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                                screenHighlightColor: window.screenHighlightColor

                                width: 290
                                height: 100
                                visible: false
                                //  anchors.top: parent.top

                                descText: "Rule 2"
                            }

                            FlavorTextBlock {
                                id: rule3TextBlock

                                blockBG: window.blockBG
                                screenColor: window.screenColor
                                screenShadeColor: window.screenShadeColor
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                                screenHighlightColor: window.screenHighlightColor

                                width: 290
                                height: 100
                                visible: false
                                //  anchors.top: parent.top

                                descText: "Rule 3"
                            }

                            FlavorTextBlock {
                                id: rule4TextBlock

                                blockBG: window.blockBG
                                screenColor: window.screenColor
                                screenShadeColor: window.screenShadeColor
                                bezelColor: window.bezelColor
                                bezelBorderColor: window.bezelBorderColor
                                screenHighlightColor: window.screenHighlightColor

                                width: 290
                                height: 100
                                visible: false
                                //  anchors.top: parent.top

                                descText: "Rule 4"
                            }

                            AttackInfoBlock {
                                id: attack1Block
                                width: 290
                                height: 200
                                visible: true
                                nameText: "Attack 1"
                                mainColor: window.primaryColor
                                bezelColor: window.bezelColor
                                screenColor: window.screenColor
                                textColor: window.textColor
                                dropTextColor: window.dropTextColor
                                borderColor: window.borderColor
                                dropBorderColor: window.dropBorderColor
                                //anchors.horizontalCenter: parent.anchors.horizontalCenter
                            }





                            AttackInfoBlock {
                                id: attack2Block
                                width: 290
                                height: 200
                                visible: false
                                nameText: "Attack 2"
                                mainColor: window.primaryColor
                                bezelColor: window.bezelColor
                                screenColor: window.screenColor
                                textColor: window.textColor
                                dropTextColor: window.dropTextColor
                                borderColor: window.borderColor
                                dropBorderColor: window.dropBorderColor
                                //anchors.horizontalCenter: parent.horizontalCenter
                            }





                            AttackInfoBlock {
                                id: attack3Block
                                width: 290
                                height: 200
                                visible: false
                                nameText: "Attack 3"
                                mainColor: window.primaryColor
                                bezelColor: window.bezelColor
                                screenColor: window.screenColor
                                textColor: window.textColor
                                dropTextColor: window.dropTextColor
                                borderColor: window.borderColor
                                dropBorderColor: window.dropBorderColor
                                //anchors.horizontalCenter: parent.horizontalCenter
                            }





                            AttackInfoBlock {
                                id: attack4Block
                                width: 290
                                height: 200
                                visible: false
                                nameText: "Attack 4"
                                mainColor: window.primaryColor
                                bezelColor: window.bezelColor
                                screenColor: window.screenColor
                                textColor: window.textColor
                                dropTextColor: window.dropTextColor
                                borderColor: window.borderColor
                                dropBorderColor: window.dropBorderColor
                                //anchors.horizontalCenter: parent.horizontalCenter
                            }





                            AbilityInfoBlock {
                                id: ability1
                                width: 290
                                nameText: "Ability 1"
                                typeText: "Ability 1 Type"
                                descText: "Ability 1 Description"
                            }





                            AbilityInfoBlock {
                                id: ability2
                                width: 290
                                visible: false
                                nameText: "Ability 2"
                                typeText: "Ability 2 Type"
                                descText: "Ability 2 Description"
                            }




                        }
                    }
                    Flickable {
                        id: rightScrollView
                        height: 430
                        anchors.left: leftScrollView.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.leftMargin: 23
                        anchors.rightMargin: 4
                        anchors.topMargin: 4
                        contentX: 0
                        contentWidth: 250
                        flickableDirection: Flickable.VerticalFlick
                        clip: false
                        boundsBehavior: Flickable.DragOverBounds
                        boundsMovement: Flickable.FollowBoundsBehavior
                        contentHeight: 800 // Set a suitable height for your content

                        Column {
                            id: rightSideColumn
                            x: 0
                            y: 0
                            width: 335
                            height: 435

                            spacing: 4


                            Rectangle {
                                id: supertypeBlock
                                width: 210
                                height: 40
                                visible: true
                                color: "#c80d0d"
                                radius: 8
                                border.color: "#580a0a"
                                border.width: 1
                                Rectangle {
                                    id: rectangle30
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
                                    id: supertypeScreen
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
                                        id: supertypeText
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
                                        anchors.fill: supertypeText
                                        source: supertypeText
                                        verticalOffset: 3
                                        samples: 16
                                        horizontalOffset: 3
                                    }

                                    Text {
                                        id: supertypeDropText
                                        visible: false
                                        color: "#2a7b2d"
                                        text: supertypeText.text
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
                                        id: rectangle31
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

                            Rectangle {
                                id: nameBlock
                                width: 245
                                height: 80
                                color: "#c80d0d"
                                radius: 8
                                border.color: "#580a0a"
                                border.width: 1
                                anchors.horizontalCenter: parent.horizontalCenter

                                Rectangle {
                                    id: rectangle12
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
                                    id: nameScreen
                                    color: screenColor
                                    radius: 4
                                    border.color: "#128c17"
                                    border.width: 2
                                    anchors.fill: parent
                                    anchors.leftMargin: 11
                                    anchors.rightMargin: 11
                                    anchors.topMargin: 7
                                    anchors.bottomMargin: 7
                                    clip: true

                                    Text {
                                        id: nameText
                                        color: "#c5002a02"
                                        // Safely access the name property
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
                                        minimumPointSize: 8
                                        minimumPixelSize: 8
                                        font.pointSize: 30
                                        z: 1
                                        font.styleName: "Bold Italic"
                                        fontSizeMode: Text.Fit
                                    }
                                    // Apply a DropShadow effect to the image
                                    DropShadow {
                                        anchors.fill: nameText
                                        source: nameText
                                        // The image to which we are applying the shadow
                                        horizontalOffset: 3 // Adjust X-axis shadow offset
                                        verticalOffset: 3 // Adjust Y-axis shadow offset
                                        radius: 3.8 // Blur effect, adjust for smoothness
                                        samples: 16 // Higher value for smoother shadows
                                        color: "#095f0c" // Color of the shadow
                                        opacity: 0.8 // Transparency of the shadow
                                    }

                                    Text {
                                        id: nameDropText
                                        visible: false
                                        color: "#2a7b2d"
                                        text: nameText.text
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
                                        minimumPointSize: 8
                                        minimumPixelSize: 8
                                        z: 0
                                        fontSizeMode: Text.Fit
                                        font.styleName: "Bold Italic"
                                        font.pointSize: 30
                                    }

                                    Rectangle {
                                        id: rectangle25
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
                                }
                            }

                            Row {
                                id: typesRow
                                width: 294
                                height: 106
                                spacing: 4
                                anchors.horizontalCenter: parent.horizontalCenter

                                TypeBlock {
                                    id: typeBlock
                                    border.width: 1
                                    anchors.verticalCenter: parent.verticalCenter
                                    color: "#ff0000"
                                    height: 106
                                    visible: true
                                    radius: 8
                                    border.color: "#580a0a"
                                    width: 55
                                    type1Type: "Type 1"
                                    type2Type: "Type 2"

                                }

                                SubtypeBlock {
                                    id: subtypeBlock
                                    border.color: "#006c0101"
                                    border.width: 0
                                    anchors.verticalCenter: parent.verticalCenter
                                    blockBorderColor: "#6c0101"
                                    color: window.blockBG
                                    height: 106
                                    radius: 6
                                    width: 234

                                    sub1Text: "Subtype 1"
                                    sub2Text: "Subtype 2"
                                    sub3Text: "Subtype 3"
                                    sub4Text: "Subtype 4"
                                }
                            }



                            FlavorTextBlock {
                                id: flavorTextBlock

                                // blockBG: window.blockBG
                                // screenColor: window.screenColor
                                // screenShadeColor: window.screenShadeColor
                                // bezelColor: window.bezelColor
                                // bezelBorderColor: window.bezelBorderColor
                                // screenHighlightColor: window.screenHighlightColor

                                width: 260
                                height: 100
                                visible: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                //  anchors.top: parent.top

                                descText: "Flavor Text"
                            }


                            SetLogoBlock {
                                id: setLogoBlock
                                anchors.horizontalCenter: parent.horizontalCenter
                                border.color: "#6c0101"
                                border.width: 2
                                color: "#c80d0d"
                                height: 180
                                visible: true
                                radius: 8
                                width: 260
                                logoSource: (selectedIndex >= 0 && selectedIndex < cards.length) ? cards[selectedIndex].setLogo : ""
                                logoScreenText: (selectedIndex >= 0
                                                 && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                                                  : "Set Logo"
                            }


                            Row {
                                id: setSymbolRow
                                width: 250
                                height: 100
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 3

                                SetSymbolBlock {
                                    id: setSymbolBlock
                                    border.color: "#6c0101"
                                    border.width: 2
                                    color: "#c80d0d"
                                    height: 125
                                    radius: 8
                                    width: 125
                                    imageSource: (selectedIndex >= 0
                                                  && selectedIndex < cards.length) ? cards[selectedIndex].setSymbol : ""
                                    blockText: (selectedIndex >= 0
                                                && selectedIndex < cards.length) ? "" // Fallback if name is undefined
                                                                                 : "Set Symbol"
                                }

                                Rectangle {
                                    id: setBlock
                                    width: 125
                                    height: 125
                                    color: "#c80d0d"
                                    radius: 8
                                    border.color: "#6c0101"
                                    border.width: 2

                                    Rectangle {
                                        id: setNameBezel
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
                                            id: setNameScreen
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
                                            clip: true

                                            Text {
                                                id: setNameText
                                                color: "#c5002a02"
                                                // Safely access the name property
                                                text: (selectedIndex >= 0
                                                       && selectedIndex < cards.length) ? cards[selectedIndex].set || "No Name Available" // Fallback if name is undefined
                                                                                        : "Set Name"
                                                anchors.fill: parent
                                                anchors.leftMargin: 4
                                                anchors.rightMargin: 4
                                                anchors.topMargin: 4
                                                anchors.bottomMargin: 4

                                                // Fallback when no card is selected
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                font.pointSize: 13
                                                minimumPointSize: 6
                                                minimumPixelSize: 6
                                                z: 1
                                                font.styleName: "ExtraBold Italic"
                                                fontSizeMode: Text.Fit
                                            }
                                            // Apply a DropShadow effect to the image
                                            DropShadow {
                                                anchors.fill: setNameText
                                                source: setNameText // The image to which we are applying the shadow
                                                horizontalOffset: 5 // Adjust X-axis shadow offset
                                                verticalOffset: 5 // Adjust Y-axis shadow offset
                                                radius: 3.8 // Blur effect, adjust for smoothness
                                                samples: 16 // Higher value for smoother shadows
                                                color: "#095f0c" // Color of the shadow
                                                opacity: 0.8 // Transparency of the shadow
                                            }

                                            Text {
                                                id: setNameDropText
                                                color: "#095f0c"
                                                text: setNameText.text
                                                anchors.fill: parent
                                                anchors.leftMargin: 4
                                                anchors.rightMargin: 4
                                                anchors.topMargin: 4
                                                anchors.bottomMargin: 4
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                                wrapMode: Text.Wrap
                                                font.pointSize: 13
                                                z: 0
                                                minimumPointSize: 6
                                                minimumPixelSize: 6
                                                fontSizeMode: Text.Fit
                                                font.styleName: "ExtraBold Italic"
                                            }

                                            Rectangle {
                                                id: rectangle26
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
                                        }
                                    }
                                }
                            }





                        }
                    }
                }
            }
        }

        ToolBar {
            id: pagingButtonsToolbar
            width: 700
            height: 90
            Layout.preferredHeight: 50
            Layout.fillHeight: false
            Layout.fillWidth: true
            Rectangle {
                id: rectangle6
                width: 420
                height: 50
                visible: true
                color: "#00ffffff"
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                z: 1

                Button {
                    id: btnFirst
                    width: 42
                    height: 35
                    text: "First"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    Layout.minimumHeight: 26
                    Layout.minimumWidth: 42
                    Layout.preferredHeight: 26
                    Layout.preferredWidth: 42
                    scale: hovered ? 1.05 : 1.0
                    palette.button: "blue"
                    hoverEnabled: true
                    highlighted: false
                    font.styleName: "Bold Italic"
                    flat: false
                    enabled: selectedIndex > 0
                    Rectangle {
                        id: rectangle9
                        color: "#00ffffff"
                        radius: 8
                        border.color: "#6c0101"
                        border.width: 3
                        anchors.fill: parent
                        anchors.leftMargin: -2
                        anchors.rightMargin: -2
                        anchors.topMargin: -2
                        anchors.bottomMargin: -2
                    }
                    ToolTip.timeout: 5000
                    ToolTip.delay: 800
                    Layout.fillWidth: false
                    Layout.fillHeight: false

                    onClicked: selectedIndex = 0
                }

                Button {
                    id: button
                    width: 70
                    height: 35
                    text: "Previous"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: btnFirst.right
                    anchors.leftMargin: 20
                    Layout.fillHeight: false
                    Layout.fillWidth: false
                    highlighted: false
                    flat: false
                    font.styleName: "Bold Italic"
                    enabled: selectedIndex > 0
                    onClicked: {
                        onPrevCard()
                    }
                    palette {
                        button: "blue"
                    }

                    Rectangle {
                        id: rectangle8
                        color: "#00ffffff"
                        radius: 8
                        border.color: "#6c0101"
                        border.width: 3
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
                    ToolTip.text: qsTr("See the previous card in the search results.")

                    // Change scale when hovered
                    scale: hovered ? 1.05 : 1.0
                }


                Button {
                    id: button1
                    x: 269
                    width: 70
                    height: 35
                    text: "Next"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: btnLast.left
                    anchors.rightMargin: 20
                    font.styleName: "Bold Italic"
                    font.pointSize: 11
                    font.bold: true
                    enabled: selectedIndex < cards.length - 1
                    onClicked: {
                        onNextCard()
                    }
                    palette {
                        button: "blue"
                    }

                    Rectangle {
                        id: rectangle10
                        color: "#00ffffff"
                        radius: 8
                        border.color: "#6c0101"
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
                    ToolTip.text: qsTr("See the next card in the search results.")

                    // Change scale when hovered
                    scale: hovered ? 1.05 : 1.0
                }

                Button {
                    id: btnLast
                    x: 345
                    width: 42
                    height: 35
                    text: "Last"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    Layout.minimumHeight: 26
                    Layout.minimumWidth: 42
                    Layout.preferredHeight: 26
                    Layout.preferredWidth: 42
                    scale: hovered ? 1.05 : 1.0
                    palette.button: "blue"
                    hoverEnabled: true
                    highlighted: false
                    font.styleName: "Bold Italic"
                    flat: false
                    enabled: cards.length > 0 && selectedIndex < cards.length - 1
                    Rectangle {
                        id: rectangle11
                        color: "#00ffffff"
                        radius: 8
                        border.color: "#6c0101"
                        border.width: 3
                        anchors.fill: parent
                        anchors.leftMargin: -2
                        anchors.rightMargin: -2
                        anchors.topMargin: -2
                        anchors.bottomMargin: -2
                    }
                    ToolTip.timeout: 5000
                    ToolTip.delay: 800
                    Layout.fillWidth: false
                    Layout.fillHeight: false

                    onClicked: selectedIndex = cards.length - 1
                }

            }

            Rectangle {
                id: rectangle
                visible: true
                color: "#6c0101"
                radius: 10
                border.color: "#ee0000"
                border.width: 5
                anchors.fill: parent
                anchors.leftMargin: -6
                anchors.rightMargin: -6
                anchors.topMargin: 0
                anchors.bottomMargin: -1
                z: 0

                Rectangle {
                    id: rectangle100
                    color: "#00ffffff"
                    radius: 0
                    border.color: "#ee0000"
                    border.width: 4
                    anchors.fill: parent
                    anchors.bottomMargin: 0
                }
            }

            Rectangle {
                id: rectangle2
                visible: false
                color: "#00951111"
                radius: 8
                border.color: "#6c0101"
                border.width: 1
                anchors.fill: parent
                anchors.leftMargin: -6
                anchors.rightMargin: -6
                anchors.bottomMargin: 0
                z: 0
            }

            Rectangle {
                id: clearButtonHighlight
                x: 10
                width: 100
                height: 70
                visible: true
                color: "#c80d0d"
                radius: 3
                border.color: primaryColor
                border.width: 0
                anchors.verticalCenter: parent.verticalCenter
                scale: 1
                anchors.verticalCenterOffset: 0
                z: 0

                Button {
                    id: btnClear
                    text: ""
                    anchors.fill: parent
                    anchors.leftMargin: 3
                    anchors.rightMargin: 4
                    anchors.topMargin: 3
                    anchors.bottomMargin: 4
                    padding: 0
                    horizontalPadding: 0
                    verticalPadding: 0
                    clip: true
                    z: 0
                    activeFocusOnTab: false

                    signal clearParams;
                    x: -4
                    y: 2

                    ToolTip.delay: 800
                    ToolTip.timeout: 5000
                    ToolTip.visible: hovered
                    ToolTip.text: qsTr("Clear all search parameters.")

                    onClicked: {
                        // setComboBox.clearParams();
                        //console.log("Calling signal clearParams()");
                        clearParams();

                    }
                    onPressed: {
                        clearButtonHighlight.border.color = screenColor;
                        clearButtonHighlight.color = screenColor;
                    }
                    onReleased: {
                        clearButtonHighlight.border.color = primaryColor;
                        clearButtonHighlight.color = primaryColor;

                    }

                    Image {
                        id: image
                        y: -38
                        width: 176
                        height: 210
                        source: "https://images.pokemontcg.io/swsh35/51_hires.png"
                        anchors.horizontalCenterOffset: -1
                        anchors.horizontalCenter: parent.horizontalCenter
                        scale: 0.8
                        sourceSize.height: 209
                        sourceSize.width: 150
                        fillMode: Image.PreserveAspectCrop
                    }
                }
            }

            Rectangle {
                id: counterRect
                y: 20
                visible: true
                color: "#00951111"
                radius: 3
                border.color: "#6c0101"
                border.width: 2
                anchors.fill: parent
                anchors.leftMargin: -6
                anchors.rightMargin: -6
                anchors.topMargin: 0
                anchors.bottomMargin: -1
                z: 0

                Text {
                    id: _text
                    width: 109
                    height: 30
                    color: dropTextColor
                    text: cards.length ? ((selectedIndex + 1) + "/" + cards.length) : "-/-"
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                    z: 1
                    clip: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    fontSizeMode: Text.HorizontalFit
                    font.styleName: "Bold Italic"
                }

                Rectangle {
                    id: rectangle3
                    x: 149
                    width: 410
                    height: 45
                    visible: true
                    color: "#6c0101"
                    radius: 8
                    border.color: "#ff0000"
                    border.width: 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    z: 0

                    Rectangle {
                        id: counterBezel
                        width: 90
                        height: 35
                        color: bezelColor
                        radius: 4
                        border.color: bezelBorderColor
                        border.width: 2
                        anchors.verticalCenter: parent.verticalCenter
                        z: 0
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            id: counterScreen
                            y: -4
                            color: screenColor
                            radius: 4
                            border.color: screenShadeColor
                            border.width: 2
                            anchors.fill: parent
                            anchors.leftMargin: 4
                            anchors.rightMargin: 4
                            anchors.topMargin: 4
                            anchors.bottomMargin: 4
                            z: 1
                        }

                        Rectangle {
                            id: counterScreen1
                            y: -4
                            color: "#0000FFFF"
                            radius: 4
                            border.color: borderColor
                            border.width: 2
                            anchors.fill: parent
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            anchors.topMargin: 0
                            anchors.bottomMargin: 0
                            state: ""
                            z: 1
                        }
                    }
                }
            }

            Rectangle {
                id: settingsButtonHighlight
                x: 580
                width: 100
                height: 70
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
                        y: -43
                        width: 176
                        height: 210
                        source: "https://images.pokemontcg.io/swsh2/168_hires.png"
                        sourceSize.width: 150
                        sourceSize.height: 209
                        scale: 0.7
                        fillMode: Image.PreserveAspectCrop
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    clip: true
                    // activeFocusOnTab: false


                }
                anchors.verticalCenterOffset: 0
            }



        }

    }

    ListModel {
        id: imageModel
        // Initial empty list
    }

    Item {
        id: __materialLibrary__

        DefaultMaterial {
            objectName: ""
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

        DefaultMaterial {
            objectName: ""
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
    }

    Connections {
        target: backendController
        function onSearchResults(response) {

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

                // for(var i = 0; i < cards.length; i++) {
                //     //console.log((i+1) + ": " + cards[i].imageUrl);
                // }

                selectedIndex = 0; // Start with the first card
                updateAttackInfo();
                updateAbilityInfo();
                updateSubTypeInfo();
                updateSuperTypeInfo();
                updateTypeInfo();
                updateFlavorText();
                resetLeftColumnScroll();
                resetRightColumnScroll();
                updateLeftScrollView();
                updateRightScrollView();
                view.visible = true
            }
        }
    }

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
    D{i:0}D{i:30;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:31;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
D{i:33;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}D{i:105}D{i:106}D{i:108}D{i:110}
D{i:112}D{i:122}
}
##^##*/
