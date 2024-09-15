import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style

RowLayout {
    spacing: 48
    property int temp: 72
    property bool airbagOn: false
    Text {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        text: "12:00pm"
        font.family: "Inter"
        font.pixelSize: 28
        font.bold: Font.DemiBold
        color: Style.black20
    }

    Text {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        text: "%0ºF".arg(temp)
        font.family: "Inter"
        font.pixelSize: 28
        font.bold: Font.DemiBold
        color: Style.black20
    }

    Control {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        implicitHeight: 38
        background: Rectangle {
            color: Style.black20
            radius: 7
        }
        contentItem: RowLayout {
            spacing: 10
            anchors.centerIn: parent
            Image {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Layout.leftMargin: 10
                source: "qrc:/icons/top_header_icons/airbag_.svg"
            }
            Text {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: 10
                text: airbagOn ? "PASSENGER\nAIRBAG ON" : "PASSENGER\nAIRBAG OFF"
                font.family: Style.fontFamily
                font.bold: Font.Bold
                font.pixelSize: 12
                color: Style.white
            }
        }
    }
}
