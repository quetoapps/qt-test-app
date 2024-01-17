import TestApp
import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: screenRoot
    width: 1600
    height: 720
    color: "#ff5c00" // Background color

    // Property for loading percentage
    property int loadingPercentage: 0

    // Main "Welcome!" text
    Text {
        id: welcomeText
        x: 123
        y: 40
        text: "Welcome!"
        font.family: "Satoshi"
        font.pixelSize: 297
        font.bold: true
        color: "white"
    }

    // Loading progress text
    Text {
        id: loadingText
        x: 1297
        y: 530
        text: "Loading"
        font.family: "Satoshi"
        font.pixelSize: 48
        font.bold: true
        color: "white"
        horizontalAlignment: Text.AlignRight

    }

    Text {
        id: loadingTextPercent
        x: 1229
        y: 576
        font.family: "Satoshi"
        font.pixelSize: 48
        font.bold: true
        color: "white"
        text: loadingPercentage + "% of Data"
        horizontalAlignment: Text.AlignRight
    }


    // Animation for the loading percentage
    SequentialAnimation {
        id: loadingAnimation
        NumberAnimation {
            target: screenRoot
            property: "loadingPercentage"
            from: 0
            to: 100
            duration: 1000 // Duration of 2 seconds
        }
        onStopped: {
            if (loadingPercentage === 100) {
                slideOutLoadingText.start();
                slideOutLoadingText2.start();
            }
        }
    }

    PropertyAnimation {
       id: slideOutLoadingText
       target: loadingText
       property: "x"
       to: screenRoot.width
       duration: 450
       easing.type: Easing.InOutQuad // Use a standard easing type
       onStopped: slideOutWelcomeText.start()
   }

    PropertyAnimation {
       id: slideOutLoadingText2
       target: loadingTextPercent
       property: "x"
       to: screenRoot.width
       duration: 380
       easing.type: Easing.InOutQuad // Use a standard easing type
       onStopped: slideOutWelcomeText.start()
   }

   SequentialAnimation {
       id: slideOutWelcomeText
       PauseAnimation { duration: 200 }  // Wait for 200ms

       PropertyAnimation {
           target: welcomeText
           property: "x"
           to: screenRoot.width
           duration: 400
           easing.type: Easing.OutSine // Use another easing type for variety
       }
   }

    Component.onCompleted: {
        loadingAnimation.start();
    }
}
