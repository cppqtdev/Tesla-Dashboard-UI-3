import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.15
import "Components"
import "qrc:/LayoutManager.js" as Responsive

ApplicationWindow {
    id: root
    width: 1920
    height: 1200
    maximumHeight: height
    minimumHeight: height
    maximumWidth: width
    minimumWidth: width
    visible: true
    title: qsTr("Tesla Model 3")
    onWidthChanged: {
        if(adaptive)
            adaptive.updateWindowWidth(root.width)
    }

    onHeightChanged: {
        if(adaptive)
            adaptive.updateWindowHeight(root.height)
    }
    property var adaptive: new Responsive.AdaptiveLayoutManager(root.width,root.height, root.width,root.height)

    FontLoader {
        id: uniTextFont
        source: "qrc:/Fonts/Unitext Regular.ttf"
    }

    background: Loader {
        anchors.fill: parent
        sourceComponent: Style.mapAreaVisible ? backgroundRect : backgroundImage
    }

    Header {
        z: 99
        id: headerLayout
    }

    footer: Footer{
        id: footerLayout
        onOpenLauncher: launcher.open()
    }

    TopLeftButtonIconColumn {
        z: 99
        anchors.left: parent.left
        anchors.top: headerLayout.bottom
        anchors.leftMargin: 18
    }

    RowLayout {
        id: mapLayout
        visible: Style.mapAreaVisible
        spacing: 0
        anchors.fill: parent
        Item {
            Layout.preferredWidth: 620
            Layout.fillHeight: true
            Image {
                anchors.centerIn: parent
                source: Style.isDark ? "qrc:/icons/light/sidebar.png" : "qrc:/icons/dark/sidebar-light.png"
            }
        }

        NavigationMapHelperScreen {
            Layout.fillWidth: true
            Layout.fillHeight: true
            runMenuAnimation: true
        }
    }

    LaunchPadControl {
        id: launcher
        y: (root.height - height) / 2 + (footerLayout.height)
        x: (root.width - width ) / 2
    }

    Component {
        id: backgroundRect
        Rectangle {
            color: "#171717"
            anchors.fill: parent
        }
    }

    Component {
        id: backgroundImage
        Image {
            source: Style.getImageBasedOnTheme()
            Icon {
                icon.source: Style.isDark ? "qrc:/icons/car_action_icons/dark/lock.svg" : "qrc:/icons/car_action_icons/lock.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 350
                anchors.horizontalCenterOffset: 37
            }

            Icon {
                icon.source: Style.isDark ? "qrc:/icons/car_action_icons/dark/Power.svg" : "qrc:/icons/car_action_icons/Power.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 77
                anchors.horizontalCenterOffset: 550
            }

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 230
                anchors.horizontalCenterOffset: 440

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
                    color: Style.isDark ? Style.white : "#171717"
                }
            }

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 180
                anchors.horizontalCenterOffset: - 350

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
                    color: Style.isDark ? Style.white : "#171717"
                }
            }
        }
    }
}
