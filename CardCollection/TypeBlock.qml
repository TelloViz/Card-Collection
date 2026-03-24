import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Window 2.15
import QtQuick.Controls.Fusion 2.15
import Qt5Compat.GraphicalEffects

Rectangle {
    id: typeBlock

    property alias type1Type: type1.type
    property alias type2Type: type2.type

    // Define color scheme properties
    property color primaryColor: "#c80d0d"
    property color blockBG: "#ff0000"
    property color bezelColor: "#b2b2b2"
    property color bezelBorderColor: "#616161"
    property color screenColor: "#02d20b"
    property color screenShadeColor: "#128c17"
    property color screenHighlightColor: "#25fb2e"
    property color textColor: "#095f0c"
    property color dropTextColor: "#c5002a02"
    property color borderColor: "#6c0101"
    property color dropBorderColor: "#25fb2e"
    width: 55
    height: 106

    Column {
        id: typeFlow
        anchors.fill: parent
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        spacing: 2



        Type{
            id: type1
            height: 50
            type: "Type 1"
            blockBG: blockBG
            blockBorderColor: blockBorderColor
        }

        Type{
            id: type2
            height: 50
            type: ""
        }
    }
}
