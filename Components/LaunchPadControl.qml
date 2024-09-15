import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Style
import Qt5Compat.GraphicalEffects

Popup {
    width: 1104
    height: 445
    background: Rectangle {
        anchors.fill: parent
        radius: 9
        color: Style.alphaColor(Style.black,0.8)
    }

    contentItem: ColumnLayout {
        spacing: 8
        anchors.fill: parent
        RowLayout {
            Layout.leftMargin: 24
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            spacing: 24
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/front-defrost.svg"
                text: "Front Defrost"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/rear-defrost.svg"
                text: "Rear Defrost"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/seat.svg"
                text: "Left Seat"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/steering-wheel-warmer.svg"
                text: "Heated Steering"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/wiper.svg"
                text: "Wipers"
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            width: parent.width - 48
            height: 1
            color: Style.black30
        }

        RowLayout {
            Layout.leftMargin: 24
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            spacing: 24
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/dashcam.svg"
                text: "Dashcam"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/calendar.svg"
                text: "Calendar"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/messages.svg"
                text: "Messages"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/zoom.svg"
                text: "Zoom"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/video.svg"
                text: "Theater"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/toybox.svg"
                text: "Toybox"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/spotify.svg"
                text: "Spotify"
            }
        }

        RowLayout {
            Layout.leftMargin: 24
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            spacing: 24
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/caraoke.svg"
                text: "Caraoke"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/tunein.svg"
                text: "TuneIn"
            }
            LauncherButton {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                icon.source: "qrc:/icons/app_icons/radio.svg"
                text: "Music"
            }
        }
    }
}
