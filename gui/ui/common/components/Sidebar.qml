import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {
    implicitWidth: 100
    implicitHeight: parent.height
    color: "#1e1f20"

    signal navigateTo(string pageName)

    // Expose buttons as global
    property alias homeButton: homeSidebar.item
    property alias voiceButton: voiceSidebar.item

    Component {
        id: sidebarButton

        Button {
            id: buttonRoot
            width: sidebarColumn.width * 0.9

            HoverHandler {
                id: hoverHandler
                cursorShape: Qt.PointingHandCursor
            }

            property bool active: false
            property string pageName: ""

            background: Rectangle {
                visible: hoverHandler.hovered || active
                id: buttonBackground
                color: active ? "#004a77" : "#2e2f2f"
                radius: 20
            }

            BrightnessContrast {
                visible: hoverHandler.hovered
                anchors.fill: buttonBackground
                source: buttonBackground
                brightness: parent.pressed ? 0.15 : active ? 0.1 : 0.0
            }

            icon.color: active ?  "#7fcfff" : "#c4c7c5"
            icon.width: 32
            icon.height: 32

            text: buttonText
            display: AbstractButton.TextUnderIcon
            spacing: 5

            onClicked: navigateTo(pageName)
        }
    }

    ColumnLayout {
        id: sidebarColumn
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 20

        spacing: 10

        Item {
            Layout.fillWidth: true
            implicitHeight: childrenRect.height

            Loader {
                id: homeSidebar
                sourceComponent: sidebarButton
                anchors.horizontalCenter: parent.horizontalCenter
                onLoaded: {
                    homeButton.active = true // On create instance set homeButton activated per default

                    item.text = "Inicio"
                    item.icon.source = 'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24"><path fill="currentColor" d="M13 8.58c.78 0 1.44.61 1.44 1.42s-.66 1.44-1.44 1.44s-1.42-.66-1.42-1.44s.61-1.42 1.42-1.42M13 3c3.88 0 7 3.14 7 7c0 2.8-1.63 5.19-4 6.31V21H9v-3H8c-1.11 0-2-.89-2-2v-3H4.5c-.42 0-.66-.5-.42-.81L6 9.66A7.003 7.003 0 0 1 13 3m3 7c0-.16 0-.25-.06-.39l.89-.66c.05-.04.09-.18.05-.28l-.8-1.36c-.05-.09-.19-.14-.28-.09l-.99.42c-.18-.19-.42-.33-.65-.42L14 6.19c-.03-.14-.08-.19-.22-.19h-1.59c-.1 0-.19.05-.19.19l-.14 1.03c-.23.09-.47.23-.66.42l-1.03-.42c-.09-.05-.17 0-.23.09l-.8 1.36c-.05.14-.05.24.05.28l.84.66c0 .14-.03.28-.03.39c0 .13.03.27.03.41l-.84.65c-.1.05-.1.14-.05.24l.8 1.4c.06.1.14.1.23.1l.99-.43c.23.19.42.29.7.38l.14 1.08c0 .09.09.17.19.17h1.59c.14 0 .19-.08.22-.17l.16-1.08c.23-.09.47-.19.65-.37l.99.42c.09 0 .23 0 .28-.1l.8-1.4c.04-.1 0-.19-.05-.24l-.83-.65z"/></svg>'
                    item.pageName = "home"
                }
            }
        }

        Item {
            Layout.fillWidth: true
            implicitHeight: childrenRect.height

            Loader {
                id: voiceSidebar
                sourceComponent: sidebarButton
                anchors.horizontalCenter: parent.horizontalCenter
                onLoaded: {
                    item.text = "Voz"
                    item.icon.source = 'data:image/svg+xml;utf8,<?xml version="1.0" encoding="utf-8"?><svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M16.19 2H7.81C4.17 2 2 4.17 2 7.81V16.18C2 19.83 4.17 22 7.81 22H16.18C19.82 22 21.99 19.83 21.99 16.19V7.81C22 4.17 19.83 2 16.19 2ZM6.75 14.14C6.75 14.55 6.41 14.89 6 14.89C5.59 14.89 5.25 14.55 5.25 14.14V9.86C5.25 9.45 5.59 9.11 6 9.11C6.41 9.11 6.75 9.45 6.75 9.86V14.14ZM9.75 15.57C9.75 15.98 9.41 16.32 9 16.32C8.59 16.32 8.25 15.98 8.25 15.57V8.43C8.25 8.02 8.59 7.68 9 7.68C9.41 7.68 9.75 8.02 9.75 8.43V15.57ZM12.75 17C12.75 17.41 12.41 17.75 12 17.75C11.59 17.75 11.25 17.41 11.25 17V7C11.25 6.59 11.59 6.25 12 6.25C12.41 6.25 12.75 6.59 12.75 7V17ZM15.75 15.57C15.75 15.98 15.41 16.32 15 16.32C14.59 16.32 14.25 15.98 14.25 15.57V8.43C14.25 8.02 14.59 7.68 15 7.68C15.41 7.68 15.75 8.02 15.75 8.43V15.57ZM18.75 14.14C18.75 14.55 18.41 14.89 18 14.89C17.59 14.89 17.25 14.55 17.25 14.14V9.86C17.25 9.45 17.59 9.11 18 9.11C18.41 9.11 18.75 9.45 18.75 9.86V14.14Z" fill="#292D32"/> </svg>'
                    item.pageName = "voice"
                }
            }
        }
    }
}