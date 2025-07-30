import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../" as Pages

Pages.PageTemplate {
    Component.onCompleted: {
        mainWindow.title = "Página de inicio"
    }

    Column {
        id: homePage
        parent: content
        width: parent.width
        spacing: 30
        topPadding: 30

        Image {
            id: headerImage
            anchors.horizontalCenter: parent.horizontalCenter
            source: "assets/header.png"
        }
    }

    Column {
        id: technologyColumn

        anchors.top: homePage.bottom

        parent: content
        width: parent.width

        spacing: 6
        topPadding: 30

        Text {
            text: "<b>Tecnologias usadas</b> (" + (technologyColumn.children.length-1) + ")" // -1 = This object
            color: "#c4c7c5"
            leftPadding: homePage.width * 0.05
            font.pixelSize: 16
        }

        Component {
            id: technologySection

            RowLayout {
                id: layout
                spacing: 6
                property string logoSource: ""
                property string technologyName: ""
                property string description: ""

                Layout.preferredHeight: leftRect.implicitHeight

                Rectangle {
                    id: leftRect
                    color: "#2e2f2f"
                    Layout.fillWidth: true
                    Layout.minimumWidth: 140
                    Layout.preferredWidth: 140

                    // Remove height difference of height in left and right blocks
                    implicitHeight: Math.max(imageColumn.implicitHeight + 20, rightRect.implicitHeight)

                    bottomLeftRadius: 20
                    topLeftRadius: 20

                    Column {
                        id: imageColumn
                        width: parent.width
                        anchors.centerIn: parent
                        spacing: 6

                        Image {
                            id: image
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: layout.logoSource
                            height: 64
                            width: 64
                            fillMode: Image.PreserveAspectFit
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: layout.technologyName
                            color: "#c4c7c5"
                            font {
                                letterSpacing: 4
                                pixelSize: 8
                            }
                        }
                    }
                }

                Rectangle {
                    id: rightRect
                    color: '#2e2f2f'
                    Layout.fillWidth: true
                    Layout.minimumWidth: 100
                    Layout.preferredWidth: (homePage.width - 140) * 0.9

                    // Remove height difference of height in left and right blocks.
                    implicitHeight: Math.max(imageColumn.implicitHeight + 20, descText.implicitHeight + 20) // 20 = Padding vertical

                    bottomRightRadius: 20
                    topRightRadius: 20

                    Text {
                        id: descText
                        width: parent.width - 20 // 20 = Margin horizontal
                        anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        text: layout.description
                        color: "#c4c7c5"
                    }
                }
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/python.svg"
                item.technologyName = "PYTHON"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Es un lenguaje de alto nivel de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Iniciar y conectar la interfaz gráfica<br>" +
                    "⯀  Enviarle información al microcontrolador<br>" +
                    "⯀  Sistema de gestos<br>" +
                    "⯀  Sistema de voces (configurable)"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/arduino.svg"
                item.technologyName = "ARDUINO"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Arduino es una compañía de desarrollo de software y hardware libres, así como una comunidad internacional que diseña y manufactura placas de desarrollo de hardware para construir dispositivos digitales y dispositivos interactivos que puedan detectar y controlar objetos del mundo real.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Interpretar y actuar acorde a la información de la computadora central<br>" +
                    "⯀  Ser el cerebro de la parte electrónica (Servomotores)<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/qt.svg"
                item.technologyName = "QT + QML"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Qt es un framework multiplataforma orientado a objetos ampliamente usado para desarrollar programas que utilicen interfaz gráfica de usuario.<br>" +
                    "QML es un lenguaje basado en JavaScript creado para diseñar aplicaciones enfocadas a la interfaz de usuario. Es parte de Qt Quick, el kit de Interfaz de usuario creado por Digia junto al framework Qt<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Toda la parte visual de la interfaz<br>" +
                    "⯀  Separar la lógica interna de la UI<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/html.svg"
                item.technologyName = "HTML"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "El Lenguaje de Marcado de Hipertexto (HTML) es el código que se utiliza para estructurar y desplegar una página web y sus contenidos. Por ejemplo, sus contenidos podrían ser párrafos, una lista con viñetas, o imágenes y tablas de datos.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Estructurar la página web<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/css.svg"
                item.technologyName = "CSS"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Es un estándar que define cómo se presentan los datos en el navegador. Mientras que el HTML proporciona información sobre la estructura de un documento, el CSS indica el aspecto que debe tener: la fuente, el fondo, el texto, los colores de los links, los márgenes y la disposición de los objetos en la página.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Darle estilo a la página web<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/git.svg"
                item.technologyName = "GIT"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Es un software de control de versiones diseñado por Linus Torvalds, pensando en la eficiencia, la confiabilidad y compatibilidad del mantenimiento de versiones de aplicaciones cuando estas tienen un gran número de archivos de código fuente. Su propósito es llevar registro de los cambios en archivos de computadora incluyendo coordinar el trabajo que varias personas realizan sobre archivos compartidos en un repositorio de código.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Guardar los cambios hechos del proyecto en diferentes versiones<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/github.svg"
                item.technologyName = "GITHUB"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "GitHub es un servicio basado en la nube que aloja un sistema de control de versiones (VCS) llamado Git. Éste permite a los desarrolladores colaborar y realizar cambios en proyectos compartidos, a la vez que mantienen un seguimiento detallado de su progreso.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Alojar en la nube el código del proyecto<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/piper.svg"
                item.technologyName = "PIPER"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Un motor neuronal de texto a voz, rápido y local que incorpora espeak-ng para fonemización.<br>" +
                    "eSpeak NG es un sintetizador de texto a voz de software compacto de código abierto para Linux, Windows, Android y otros sistemas operativos. Soporta más de 100 idiomas y acentos.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Transformar texto a voz<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/chatgpt.svg"
                item.technologyName = "CHATGPT"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Es una aplicación de chatbot de inteligencia artificial desarrollada en el año 2022 por OpenAI.<br>" +
                    "El chatbot es un modelo de lenguaje especializado en el diálogo que se ajusta con técnicas de aprendizaje supervisadas y de refuerzo.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Transformar ideas o conceptos abstractos a texto<br>" +
                    "⯀  Resolver dudas técnicas (código, pintura, filamentos 3d, lijas, etc)<br>"
            }
        }

        Loader {
            sourceComponent: technologySection
            anchors.horizontalCenter: technologyColumn.horizontalCenter
            onLoaded: {
                item.logoSource = "assets/inmoov.png"
                item.technologyName = "INMOOV"
                item.description =
                    "<b>¿Qué es?</b><br>" +
                    "Es un proyecto de un robot completo open-source,<br>" +
                    "incluye código, placas, modelos 3d, guias y tienda.<br>" +
                    "<br>" +
                    "<b>Usos en nuestro proyecto:</b><br>" +
                    "⯀  Obtener solo los modelos 3d (todo el código es distinto)<br>"
            }
        }
    }
}