import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.15

Button {
    id: control
    property string setIcon : ""
    property bool isGlow: false
    scale: 1

    contentItem: Image {
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
        source: control.icon.source
        scale: control.pressed ? 0.9 : control.scale
        Behavior on scale { NumberAnimation { duration: 200; } }
    }

    background: Rectangle {
        anchors.fill: parent
        radius: width
        color: "transparent"
        border.width: 0
        border.color: "transparent"
        visible: false
        Behavior on color {
            ColorAnimation {
                duration: 200;
                easing.type: Easing.Linear;
            }
        }

        Rectangle {
            id: indicator
            property int mx
            property int my
            x: mx - width / 2
            y: my - height / 2
            height: width
            radius: width / 2
            color: isGlow ? Qt.lighter("#29BEB6") : Qt.lighter("#B8FF01")
        }
    }

    Rectangle {
        id: mask
        radius: width
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: background
        source: background
        maskSource: mask
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
    }

    ParallelAnimation {
        id: anim
        NumberAnimation {
            target: indicator
            property: 'width'
            from: 0
            to: control.width * 1.2
            duration: 200
        }
        NumberAnimation {
            target: indicator;
            property: 'opacity'
            from: 0.9
            to: 0
            duration: 200
        }
    }

    onPressed: {
        indicator.mx = mouseArea.mouseX
        indicator.my = mouseArea.mouseY
        anim.restart();
    }
}
