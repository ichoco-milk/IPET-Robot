// common/components/PageTemplate.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: pageRoot
    // Que siempre mida exactamente lo que el padre le dé
    width: parent ? parent.width : 0
    height: parent ? parent.height : 0

    // Alias para exponer sidebar y content
    property alias content: content

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 0

        // --- Área de contenido desplazable ---
        Flickable {
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
    }
}
