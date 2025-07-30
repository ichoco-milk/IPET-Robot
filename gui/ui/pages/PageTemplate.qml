import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Flickable {
    property alias content: content

    id: flickable
    Layout.fillWidth: true
    Layout.fillHeight: true
    clip: true
    boundsMovement: Flickable.StopAtBounds

    contentWidth: content.childrenRect.width
    contentHeight: content.childrenRect.height

    Item {
        id: content
        width: flickable.width
        height: Math.max(childrenRect.height, flickable.height)
    }

    ScrollBar.vertical: ScrollBar {
        policy: ScrollBar.AsNeeded
        size: flickable.visibleArea.heightRatio
        position: flickable.visibleArea.yPosition
    }
    ScrollBar.horizontal: ScrollBar {
        policy: ScrollBar.AsNeeded
        size: flickable.visibleArea.widthRatio
        position: flickable.visibleArea.xPosition
    }
}