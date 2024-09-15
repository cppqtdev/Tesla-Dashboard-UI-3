import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Button {
    id: control
    property string setIcon : ""
    property bool isGlow: false
    implicitHeight: isGlow ? 50 : 44
    implicitWidth: isGlow ? 50 : 44

    Image{
        anchors.centerIn: parent
        source: setIcon
        scale: control.pressed ? 0.9 : 1.0
        Behavior on scale { NumberAnimation { duration: 200; } }
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        Layout.fillWidth: true
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
            to: control.width * 1.5
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
