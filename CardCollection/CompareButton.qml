import QtQuick 2.13
import QtQuick.Controls 2.2
import QtQuick.Layouts

Item {
    id: _root
    width: 100
    height: 100

    property QtObject controller  // Reference to CompareController
    property string cardImageUrl  // URL for the card image

    // Define signals for left and right comparisons
    signal leftCompare(string imageUrl)
    signal rightCompare(string imageUrl)

    function toggleImages(mouse) {
        if (mouse.button === Qt.LeftButton) {
            if (!leftHalfImage.visible) {
                controller.setLeft(_root);  // Set this button as the active left
                leftCompare(cardImageUrl);  // Emit left compare signal with image URL
            } else {
                controller.clearLeft();  // Clear left compare if clicked again
            }
        } else if (mouse.button === Qt.RightButton) {
            if (!rightHalfImage.visible) {
                controller.setRight(_root);  // Set this button as the active right
                rightCompare(cardImageUrl);  // Emit right compare signal with image URL
            } else {
                controller.clearRight();  // Clear right compare if clicked again
            }
        }
    }

    // Activate and deactivate image visibility from controller
    function activateLeft() {
        leftHalfImage.visible = true
    }

    function deactivateLeft() {
        leftHalfImage.visible = false
    }

    function activateRight() {
        rightHalfImage.visible = true
    }

    function deactivateRight() {
        rightHalfImage.visible = false
    }

    Button {
        width: 100
        height: 100
        opacity: 0.5
        anchors.fill: parent

        MouseArea {
            id: clickArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: function(mouse) {
                _root.toggleImages(mouse);  // Call toggle function in the parent Item
            }
        }
    }

    Image {
        id: leftHalfImage
        y: -100
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        source: "topBall.png"
        mirror: false
        z: 0
        fillMode: Image.PreserveAspectFit
        scale: 1
        rotation: 90
    }

    Image {
        id: rightHalfImage
        visible: false
        anchors.fill: parent
        source: "bottomBall.png"
        fillMode: Image.PreserveAspectFit
        scale: 1
        rotation: -90
    }
}
