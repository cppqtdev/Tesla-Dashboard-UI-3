import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style
import Qt5Compat.GraphicalEffects
import "Components"
ApplicationWindow {
    id: root
    width: 1920
    height: 1200
    visible: true
    title: qsTr("Tesla Model 3")

    background: Image {
        source: Style.getImageBasedOnTheme()
        Icon {
            icon.source: "qrc:/icons/car_action_icons/lock.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: - 340
            anchors.horizontalCenterOffset: 33
        }

        Icon {
            icon.source: "qrc:/icons/car_action_icons/Power.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: - 77
            anchors.horizontalCenterOffset: 530
        }

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: - 230
            anchors.horizontalCenterOffset: 410

            Text {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: "Trunk"
                font.family: "Inter"
                font.pixelSize: 14
                font.bold: Font.DemiBold
                color: Style.black20
            }
            Text {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: "Open"
                font.family: "Inter"
                font.pixelSize: 16
                font.bold: Font.Bold
                color: "#171717"
            }
        }

        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: - 180
            anchors.horizontalCenterOffset: - 340

            Text {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: "Frunk"
                font.family: "Inter"
                font.pixelSize: 14
                font.bold: Font.DemiBold
                color: Style.black20
            }
            Text {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: "Open"
                font.family: "Inter"
                font.pixelSize: 16
                font.bold: Font.Bold
                color: "#171717"
            }
        }
    }

    header: Header {
        id: headerLayout
    }

    footer: Footer{
        id: footerLayout
        onOpenLauncher: launcher.open()
    }

    TopLeftButtonIconColumn {
        anchors.left: parent.left
        anchors.top: headerLayout.bottom
        anchors.leftMargin: 18
    }

    LaunchPadControl {
        id: launcher
        y: (root.height - height) / 2 + (footerLayout.height)
        x: (root.width - width ) / 2
    }
}
