import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.15

Item {
    height: 54
    width: parent.width

    TopLeftControl {
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.verticalCenter: parent.verticalCenter
    }

    TopMiddleControl {
        anchors.centerIn: parent
    }

    TopRightControl {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 24
    }
}
