// main.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import "common/components" as Components // ahora la traemos directamente
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

        // ——— Sidebar fija ———
        Components.Sidebar {
            id: sidebar
            Layout.preferredWidth: 100
            Layout.fillHeight: true
             onNavigateTo: function(pageName) {
                if (pageName === mainWindow.currentPageName) return

                switch (pageName) {
                case "home":
                    stackView.replace(homeComponent)
                    sidebar.homeButton.active  = true
                    sidebar.voiceButton.active = false
                    break
                case "voice":
                    stackView.replace(voiceComponent)
                    sidebar.homeButton.active  = false
                    sidebar.voiceButton.active = true
                    break
                }
                mainWindow.currentPageName = pageName
            }
        }

        // ——— Área animada ———
        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true

            // preinstanciamos los components
            Component { id: homeComponent; Home.HomePage {} }
            Component { id: voiceComponent; Voice.VoicePage {} }

            initialItem: homeComponent

            replaceExit: Transition {
                NumberAnimation {
                    // ANIMAMOS la posición Y del ítem que sale
                    property: "y"
                    from: 0
                    to: stackView.height
                    duration: 150
                    easing.type: Easing.InQuad
                }
            }
            // Al entrar: baja el nuevo contenido desde arriba
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

    // Atajo para mostrar/ocultar sidebar
    Shortcut {
        sequence: "Tab"
        onActivated: sidebar.visible = !sidebar.visible
    }
}
