import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Component {
        id: id_com
        Rectangle {
            id: rect
            width: 80
            height: 80
            color: "red"

            NumberAnimation on opacity {
                to: 0
                duration: 1000

                onRunningChanged: {
                    if (!running) {
                        console.log("Destroying...")
                        rect.destroy()
                    }
                }
            }
        }
    }

    Timer {
        property int i: i
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            time.text = Date().toString()
            i = i + 1
            var component = Qt.createComponent("SelfDestroyingRect.qml")
            var object = component.createObject(container)
            object.inputValue = i * 1000
            object.y = (object.height + 10) * i
            if (i > 3) {
                i = 1
            }
        }
    }

    Text {
        id: time
    }

    Item {
        id: container
        width: 500
        height: 100

        // SelfDestroyingRect {
        //     id: id_0
        // }
        // Component.onCompleted: {
        //     var component = Qt.createComponent("SelfDestroyingRect.qml")
        //     for (var i = 0; i < 5; i++) {
        //         var object = component.createObject(container)
        //         object.inputValue = i * 1000
        //         object.y = (object.height + 10) * i
        //         if (object.y > 100) {
        //             object.y = 0
        //         }
        //     }
        // }
    }
}
