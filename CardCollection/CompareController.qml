import QtQuick

QtObject {
    id: controller

    property var leftCompareButton: null
    property var rightCompareButton: null

    // Emit a signal with the image URL for left comparison
    signal leftCompare(string imageUrl)

    // Emit a signal with the image URL for right comparison
    signal rightCompare(string imageUrl)

    function setLeft(button) {
        if (leftCompareButton) {
            leftCompareButton.deactivateLeft();  // Deactivate previous left compare
        }
        leftCompareButton = button;
        leftCompareButton.activateLeft();
    }

    function setRight(button) {
        if (rightCompareButton) {
            rightCompareButton.deactivateRight();  // Deactivate previous right compare
        }
        rightCompareButton = button;
        rightCompareButton.activateRight();
    }

    function clearLeft() {
        if (leftCompareButton) {
            leftCompareButton.deactivateLeft();
            leftCompareButton = null;
        }
    }

    function clearRight() {
        if (rightCompareButton) {
            rightCompareButton.deactivateRight();
            rightCompareButton = null;
        }
    }

    // Emit the left comparison signal
    function emitLeftCompare(imageUrl) {
        console.log("CompareController: Emitting left compare...");
        leftCompare(imageUrl);  // Emit signal with image URL
    }

    // Emit the right comparison signal
    function emitRightCompare(imageUrl) {
        console.log("CompareController: Emitting right compare...");

        rightCompare(imageUrl);  // Emit signal with image URL
    }
}
