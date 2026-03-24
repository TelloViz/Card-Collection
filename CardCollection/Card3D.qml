import QtQuick 2.13
import QtQuick3D

View3D {
    id: view
    anchors.fill: parent

    PerspectiveCamera {
        y: 0
        position: Qt.vector3d(0, 200, 300)
        z: 161
        eulerRotation.x: 0
    }

    DirectionalLight {
        eulerRotation.x: -30
    }

    Model {
        //! [3dcube]
        id: cube
        y: 205
        source: "#Cube"
        scale.y: 1.5
        scale.z: 1
        scale.x: 0.01
        eulerRotation.z: 0
        eulerRotation.y: 90
        //! [3dcube]
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
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
            cube.eulerRotation.y += velocityY
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
                momentumTimer.stop()
            } else {
                cube.eulerRotation.y += dragArea.velocityY
                dragArea.velocityY *= dragArea.momentumDecay
            }
        }
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
                    source: "https://images.pokemontcg.io/xy1/1_hires.png"
                    sourceSize: Qt.size(width, height)
                    cache: false
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;cameraSpeed3d:25;cameraSpeed3dMultiplier:1}
}
##^##*/
