# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from backendcontroller import BackendController


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    QQuickStyle.setStyle("Fusion")

    backendController = BackendController()
    engine.rootContext().setContextProperty("backendController", backendController)

    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
