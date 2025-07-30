import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../common/components" as Components

Components.PageTemplate {
    Component.onCompleted: {
        mainWindow.title = "Voz"
    }

    Column {
        id: textHeader
        parent: content
        width: parent.width
        spacing: 5
        topPadding: 10
        leftPadding: 10

        Text {
            text: "Editor de Voz"
            color: "#c4c7c5"
            font {
                pixelSize: 24
                bold: true
            }
        }

        Text {
            text: "Personaliza tu experiencia de audio"
            color: "#c4c7c5"
            font.pixelSize: 12
        }
    }
}