import QtQuick

Rectangle {
    property int inputValue: 1
    id: rect
    width: 180
    height: 80
    color: "red"
    Text {
        id: id_text
        text: "Message displayed=" + inputValue
    }

    NumberAnimation on opacity {
        to: 0
        duration: 3 * 1000 //ms

        onRunningChanged: {
            if (!running) {
                console.log("Destroying...")
                rect.destroy()
            }
        }
    }
}
