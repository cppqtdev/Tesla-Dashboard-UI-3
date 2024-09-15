import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style

Control {
    id: control
    background: null
    property int value: 0
    property int maximumValue: 100
    property int minimumValue: 0
    property string icon: ""

    contentItem: RowLayout {
        spacing: 10
        anchors.centerIn: parent
        IconButton {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            icon.source: "qrc:/icons/stepper_icons/right-arrow.svg"
            enabled: value > minimumValue
            onClicked: {
                if(value > minimumValue) {
                    value -= 1
                }
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: value
            font.pixelSize: 42
            font.family: Style.fontFamily
            color: Style.black50
            visible: !icon
        }

        Image {
            visible: icon
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: icon
        }

        IconButton {
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            icon.source: "qrc:/icons/stepper_icons/left-arrow.svg"
            enabled: value < maximumValue
            onClicked: {
                if(value < maximumValue) {
                    value += 1
                }
            }
        }
    }
}
