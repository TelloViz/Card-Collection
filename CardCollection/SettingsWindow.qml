import QtQuick 2.13
import QtQuick.Controls 2.2
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects
import QtQuick3D


// Page 1: Search Page
Window {
    id: settingsWindow
    width: 400
    height: 200
    color: "#00737373"
    maximumHeight: 200
    maximumWidth: 400
    minimumHeight: 200
    minimumWidth: 400
    title: "Settings"
    onVisibleChanged: {
        if(settingsWindow.visible) {
            forceActiveFocus();
        }
    }

    StackLayout {
        id: settingsStack

        Rectangle {
            id: settingsHomePage
            anchors.fill: parent
            Layout.minimumHeight: 200
            Layout.minimumWidth: 400
            Layout.preferredHeight: 200
            Layout.preferredWidth: 400
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: bezelColor
            visible: settingsStack.currentIndex === 0

            //onVisibleChanged: console.log("settingsHomePage visible changed");

            Button {
                id: btnAbout
                x: 33
                y: 20

                width: 150
                height: 40


                text: "About"
                palette {
                    button: "blue"
                }

                Rectangle {
                    id: homeAboutButtonBorder
                    color: "#003173ff"
                    radius: 8
                    border.color: "#142c37"
                    border.width: 4
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }

                onClicked: {
                    settingsStack.currentIndex = 1;
                }


            }

            Button {
                id: btnHomeDevTools
                x: 33
                y: 87
                width: 150
                height: 40
                text: "Dev Tools"

                palette {
                    button: "blue"
                }

                Rectangle {
                    id: homeDevToolsButtonBorder
                    x: -81
                    y: -110
                    color: "#003173ff"
                    radius: 8
                    border.color: "#142c37"
                    border.width: 4
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }


                onClicked: {
                    settingsStack.currentIndex = 3
                }
            }

            Button {
                id: btnHomeThemes
                x: 225
                y: 87
                width: 150

                height: 40

                text: "Themes"

                palette {
                    button: "blue"
                }

                Rectangle {
                    id: homeThemesButtonBorder
                    x: -81
                    y: -64
                    color: "#003173ff"
                    radius: 8
                    border.color: "#142c37"
                    border.width: 4
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }

                onClicked: {
                    settingsStack.currentIndex = 2;
                }
            }

            Button {
                id: btnHomeData
                x: 225
                y: 20
                width: 150
                height: 40
                text: "Data"
                palette.button: "blue"

                onClicked: {
                    settingsStack.currentIndex = 4;
                }

                Rectangle {
                    id: homeDataButtonBorder
                    color: "#003173ff"
                    radius: 8
                    border.color: "#142c37"
                    border.width: 4
                    anchors.fill: parent
                    anchors.leftMargin: -2
                    anchors.rightMargin: -2
                    anchors.topMargin: -2
                    anchors.bottomMargin: -2
                }
            }


        }

        Rectangle {
            id: aboutPage
            anchors.fill: parent
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: blockBG
            visible: settingsStack.currentIndex === 1

            //onVisibleChanged: console.log("aboutPage visible changed");

        }
        Rectangle {
            id: themePage
            anchors.fill: parent
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: screenColor
            visible: settingsStack.currentIndex === 2

            //onVisibleChanged: console.log("themePage visible changed");

        }
        Rectangle {
            id: devToolsPage
            anchors.fill: parent
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: settingsStack.currentIndex === 3
            color: "#26bd4b"
        }
        Rectangle {
            id: dataPage
            anchors.fill: parent
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: settingsStack.currentIndex === 3
            color: "#feff6a"
        }
    }

    Button {
        id: btnBack
        y: 146

        height: 40
        text: "Back"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 70
        anchors.rightMargin: 70
        anchors.bottomMargin: 10

        palette {
            button: "blue"
        }

        Rectangle {
            id: backButtonBorder
            x: -81
            y: -156
            color: "#003173ff"
            radius: 8
            border.color: "#142c37"
            border.width: 4
            anchors.fill: parent
            anchors.leftMargin: -2
            anchors.rightMargin: -2
            anchors.topMargin: -2
            anchors.bottomMargin: -2
        }

        onClicked: {
            if(settingsStack.currentIndex > 0) {
                settingsStack.currentIndex = 0;
            } else {
                settingsWindow.visible = false;
            }
        }
    }

    Rectangle {
        id: rectangle
        color: "#00ffffff"
        radius: 32
        border.color: "#585858"
        border.width: 16
        anchors.fill: parent
        anchors.leftMargin: -12
        anchors.rightMargin: -12
        anchors.topMargin: -12
        anchors.bottomMargin: -12
    }
}
