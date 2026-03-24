import QtQuick 2.13
import QtQuick.Controls 2.13

Flow {
    id: collectionFlow

    property alias cards: repeaterModel.model
    property int viewportHeight: 0
    property int viewportY: 0

    // Signals to emit for comparison
    signal cardFlowLeftCompare(string imageUrl)
    signal cardFlowRightCompare(string imageUrl)

    property string collectionFlowImageUrl  // URL for the card image
    property int numCardColumns: 4


    Repeater {
        id: repeaterModel
        model: []

        delegate: Item {
            width: collectionFlow.width / numCardColumns
            height: width * 3.5 / 2.5

            property bool isVisible: (y + height) > collectionFlow.viewportY &&
                                     y < (collectionFlow.viewportY + collectionFlow.viewportHeight)

            Image {
                id: cardImage
                visible: parent.isVisible
                source: modelData.imageUrl
                fillMode: Image.PreserveAspectFit
                smooth: true
                sourceSize.width: parent.width
                sourceSize.height: parent.height * 3.5 / 2.5
                anchors.margins: 5
                anchors.fill: parent
            }

            // Add CompareButton to handle left and right image toggling
            CompareButton {
                anchors.top: parent.top
                anchors.right: parent.right
                width: 30
                height: 30
                opacity: 0.7
                controller: compareController
                cardImageUrl: modelData.imageUrl  // Pass the image URL directly

                // Emit signals from CardFlow on button clicks
                onLeftCompare: {
                   // console.log("CompareButton settings collectionFlowImageUrl to: " + cardImageUrl);
                    collectionFlowImageUrl = cardImageUrl
                   // console.log("CardFlow.collectionFlowImageUrl set to: " + collectionFlowImageUrl);
                   //  console.log("CardFlow.CompareButton caught onLeftCompare with: " + cardImageUrl);
                   // console.log("CardFlow.ComapreButton now broadcasting on signal collectionFLow.cardFlowLeftCompare with: " + cardImageUrl);
                    collectionFlow.cardFlowLeftCompare(cardImageUrl)
                   // console.log(" Control returned to CompareButton.onLeftCompare");
                }
                // Emit signals from CardFlow on button clicks
                onRightCompare: {
                    //console.log("CompareButton settings collectionFlowImageUrl to: " + cardImageUrl);
                    collectionFlowImageUrl = cardImageUrl
                   // console.log("CardFlow.collectionFlowImageUrl set to: " + collectionFlowImageUrl);
                   //  console.log("CardFlow.CompareButton caught onrightCompare with: " + cardImageUrl);
                   // console.log("CardFlow.ComapreButton now broadcasting on signal collectionFLow.cardFlowrightCompare with: " + cardImageUrl);
                    collectionFlow.cardFlowRightCompare(cardImageUrl)
                   // console.log(" Control returned to CompareButton.onrightCompare");
                }            }

            Component.onCompleted: {
               // console.log("Item index:", index, "y position:", y, "isVisible:", isVisible)
            }
        }
    }
}
