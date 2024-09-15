import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ColumnLayout {
    spacing: 3
    Icon {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        icon.source: "qrc:/light-icons/Headlight2.svg"
    }
    Icon {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        icon.source: "qrc:/light-icons/Property 1=Default.svg"
    }
    Icon {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        icon.source: "qrc:/light-icons/Headlights.svg"
    }
    Icon {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        icon.source: "qrc:/light-icons/Seatbelt.svg"
    }
}
