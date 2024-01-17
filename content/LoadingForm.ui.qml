import QtQuick 6.2
import QtQuick.Controls 6.2
import TestApp

Rectangle {
    id: loadingScreen
    width: 1600
    height: 720
    color: "#1B1D23"

    Image {
        anchors.centerIn: parent
        source: "images/skcal-logo.svg"
    }
}
