import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style

RowLayout {
    id: root
    property int index: 0
    property int batteryPercentage: 90
    spacing: 51
    RowLayout {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        spacing: 4
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 0
            color: current ? "#171717" : Style.black20
            text: "P"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 1
            color: current ? "#171717" : Style.black20
            text: "R"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 2
            color: current ? "#171717" : Style.black20
            text: "N"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            property bool current: root.index === 3
            color: current ? "#171717" : Style.black20
            text: "D"
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18
        }
    }

    RowLayout {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: "qrc:/icons/top_header_icons/battery.svg"
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: Style.black10
            text: qsTr("%0 %").arg(batteryPercentage)
            font.family: "Inter"
            font.bold: Font.Bold
            font.pixelSize: 18
        }
    }
}
