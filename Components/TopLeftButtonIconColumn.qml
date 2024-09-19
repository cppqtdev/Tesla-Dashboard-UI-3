import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

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
