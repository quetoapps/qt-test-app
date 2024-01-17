// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import TestApp

Window {
    id: window
    visible: true
    color: "#5f5151"
    title: "Test App"

    // Define the initial size of the window
    width: 1600
    height: 720

    // Create a property to hold the current screen
    property string currentScreen: "loading"

    // Use a Loader to manage the screen components
    Loader {
        id: screenLoader
        anchors.fill: parent
        source: currentScreen === "loading" ? "LoadingForm.ui.qml" : "Screen01.ui.qml"
        // source: currentScreen === "loading" ? "LoadingForm.ui.qml" : "Welcome.ui.qml"
    }

    // Add a Timer to simulate the loading process
    Timer {
        id: loadingTimer
        interval: 100
        repeat: false
        running: true
        onTriggered: {
            // Change the current screen to the main screen
            window.currentScreen = "main"
            screenLoader.source = "Screen01.ui.qml"
        }
    }
}
