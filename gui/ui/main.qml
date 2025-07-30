import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import "common/components" as Components
import "pages/home" as Home
import "pages/voice" as Voice

Window {
    id: mainWindow
    visible: true
    width: 640; height: 480
    minimumWidth: 640; minimumHeight: 480
    color: "#131314"

    property string currentPageName: "home"
    property alias sidebar: sidebar

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Components.Sidebar {
            id: sidebar
            Layout.preferredWidth: 100
            Layout.fillHeight: true

            property var lastSidebarButton: sidebar.homeButton

            onNavigateTo: function(pageName) {
                if (pageName === mainWindow.currentPageName) return

                mainWindow.currentPageName = pageName
                if (lastSidebarButton != null) {
                    lastSidebarButton.active = false;
                }

                switch (pageName) {
                case "home":
                    stackView.replace(homeComponent)
                    lastSidebarButton = sidebar.homeButton
                    break
                case "voice":
                    stackView.replace(voiceComponent)
                    lastSidebarButton = sidebar.voiceButton
                    break
                default:
                    stackView.clear()
                    console.error("Unknown page \"" + pageName + "\"")
                    return;
                }
                lastSidebarButton.active = true
            }
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true

            Component { id: homeComponent; Home.HomePage {} }
            Component { id: voiceComponent; Voice.VoicePage {} }

            initialItem: homeComponent

            // Exit content animation, move all content to down but with more velocity than enter content
            replaceExit: Transition {
                NumberAnimation {
                    property: "y"
                    from: 0
                    to: stackView.height
                    duration: 150
                    easing.type: Easing.InQuad
                }
            }

            // Exit content animation, move all content to down
            replaceEnter: Transition {
                NumberAnimation {
                    property: "y"
                    from: -stackView.height
                    to: 0
                    duration: 300
                    easing.type: Easing.OutQuad
                }
            }
        }
    }

    Shortcut { // Hide/Show sidebar
        sequence: "Tab"
        onActivated: sidebar.visible = !sidebar.visible
    }
}
