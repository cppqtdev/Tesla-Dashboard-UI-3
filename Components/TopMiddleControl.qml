import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style
RowLayout {
    spacing: 32

    Icon {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        icon.source: "qrc:/icons/top_header_icons/lock.svg"
    }

    RowLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        spacing: 15
        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            source: "qrc:/icons/top_header_icons/icons.svg"
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: 28
            font.bold: Font.DemiBold
            font.family: "Inter"
            color: Style.black20
            text: qsTr("Easy Entry")
        }
    }

    Icon {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        icon.source: "qrc:/icons/top_header_icons/Sentry.svg"
    }
}
