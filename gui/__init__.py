import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    app.setWindowIcon(QIcon(str(Path("icon.svg"))))

    engine = QQmlApplicationEngine()

    engine.load("ui/main.qml")
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())