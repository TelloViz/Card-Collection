import QtQuick 2.13
import QtQuick.Controls.Fusion 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15

ToolBar {
                            id: searchTools
                            RowLayout {
                                id: searchRow
                                x: 6
                                y: 6
                                anchors.fill: parent
                                z: 3
                                spacing: 5

                                TextField {
                                    id: txtSearchBox
                                    width: 200
                                    height: 36
                                    anchors.verticalCenter: btnSearch.verticalCenter
                                    anchors.left: btnSearch.right
                                    anchors.right: btnSearch.left
                                    anchors.top: btnSearch.bottom
                                    anchors.bottom: btnSearch.top
                                    anchors.leftMargin: -468
                                    anchors.rightMargin: 5
                                    anchors.topMargin: -26
                                    anchors.bottomMargin: -26
                                    anchors.horizontalCenter: btnSearch.horizontalCenter
                                    z: 0
                                    Layout.leftMargin: 6
                                    Layout.preferredHeight: -1
                                    Layout.preferredWidth: -1
                                    placeholderText: qsTr("Enter card name")
                                    Layout.fillWidth: true

                                    Rectangle {
                                        id: rectangle7
                                        color: "#00951111"
                                        radius: 4
                                        border.color: "#6c0101"
                                        border.width: 2
                                        anchors.fill: parent
                                        anchors.leftMargin: -2
                                        anchors.rightMargin: -2
                                        clip: false
                                        scale: 1
                                        z: 0
                                    }
                                }
                                Button {
                                    id: btnSearch
                                    width: 100
                                    height: 40
                                    text: qsTr("Search")
                                    font.styleName: "Bold Italic"
                                    Layout.fillHeight: false
                                    Layout.rightMargin: 6
                                    Layout.fillWidth: false
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
                                        // console.log("Search Button clicked...");
                                        // Initialize an empty array for the search parameters
                                        var searchParams = []

                                        // Check if the search box is not empty
                                        if (txtSearchBox.text.trim() !== "") {
                                            // Create a tuple with the entered name
                                            searchParams.push(
                                                        ['', 'name', txtSearchBox.text])
                                        }

                                        // Collecting selected items from the ComboBox
                                        for (var i = 0; i < setsModel.count; i++) {
                                            var item = setsModel.get(i)
                                            if (item.selected) {
                                                // Build the tuple for each selected set item
                                                searchParams.push(
                                                            ['set', 'name', item.name])
                                            }
                                        }

                                        // Check the state of each Pokémon TCG type button and add to search parameters if checked
                                        if (searchFilterTools.fireChecked) {
                                            searchParams.push(
                                                        ['types', '', 'fire'])
                                        }
                                        if (searchFilterTools.waterChecked) {
                                            searchParams.push(
                                                        ['types', '', 'water'])
                                        }
                                        if (searchFilterTools.grassChecked) {
                                            searchParams.push(
                                                        ['types', '', 'grass'])
                                        }
                                        if (searchFilterTools.lightningChecked) {
                                            searchParams.push(
                                                        ['types', '', 'lightning'])
                                        }
                                        if (searchFilterTools.psychicChecked) {
                                            searchParams.push(
                                                        ['types', '', 'psychic'])
                                        }
                                        if (searchFilterTools.fightingChecked) {
                                            searchParams.push(
                                                        ['types', '', 'fighting'])
                                        }
                                        if (searchFilterTools.darknessChecked) {
                                            searchParams.push(
                                                        ['types', '', 'darkness'])
                                        }
                                        if (searchFilterTools.fairyChecked) {
                                            searchParams.push(
                                                        ['types', '', 'fairy'])
                                        }
                                        if (searchFilterTools.dragonChecked) {
                                            searchParams.push(
                                                        ['types', '', 'dragon'])
                                        }
                                        if (searchFilterTools.metalChecked) {
                                            searchParams.push(
                                                        ['types', '', 'metal'])
                                        }
                                        if (searchFilterTools.colorlessChecked) {
                                            searchParams.push(
                                                        ['types', '', 'colorless'])
                                        }

                                        // Call the request_search function with the built tuples if there are any
                                        if (searchParams.length > 0) {
                                            //console.log("Search Button Pressed...")
                                            //console.log("Calling backendController.request_search with parameters:")
                                            //Print each tuple as a string to the console
                                            for (var i = 0; i < searchParams.length; i++) {
                                                var tupleString = "[" + searchParams[i][0] + ", "
                                                        + searchParams[i][1] + ", "
                                                        + searchParams[i][2] + "]"

                                                //console.log(tupleString);
                                            }
                                            //  console.log("search button is calling request_search");
                                            backendController.request_search(
                                                        searchParams)
                                            //  console.log("Search button regains control after request search");
                                            resetLeftColumnScroll()
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                id: rectangle5
                                color: "#00ffffff"
                                radius: 4
                                border.color: "#6c0101"
                                border.width: 2
                                anchors.fill: parent
                                z: 1

                                Rectangle {
                                    id: rectangle30
                                    color: "#00ffffff"
                                    radius: 4
                                    border.color: "#ee0000"
                                    border.width: 2
                                    anchors.fill: parent
                                    anchors.leftMargin: 2
                                    anchors.rightMargin: 2
                                    anchors.topMargin: 4
                                    anchors.bottomMargin: 4
                                }
                            }

                            Rectangle {
                                id: rectangle6
                                color: "#cc1c1c"
                                border.color: "#00000000"
                                anchors.fill: parent
                            }
                        }
