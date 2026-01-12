import QtQuick
import QtQuick.Controls
import QtMultimedia

Window {
    id: root
    width: 600
    height: 400
    visible: true
    title: qsTr("Hello Goon")
    color: "gray"
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint

    SoundEffect {
        id: endcredits
        source: "qrc:/resources/p4.wav"
    }

    Video {
        id: endVideo
        anchors.fill: parent
        source: "dam.mp4"
        fillMode: Video.PreserveAspectFit
        autoPlay: false
        visible: false

        onPlaybackStateChanged: {
            if (playbackState === MediaPlayer.StoppedState && position > 0) {
                endVideo.visible = false
                mainui.visible = true
            }
        }
    }

    property int countval: 0
    property bool vf: true

    Item {
        id: mainui
        visible: true
        anchors.fill: parent

        Image {
            id: logoimage
            source: "qrc:/resources/giphy.png"
            width: 100
            fillMode: Image.PreserveAspectFit
            asynchronous: true
            anchors.left: parent.left
            anchors.leftMargin: 4
            anchors.top: parent.top
            anchors.topMargin: 4
        }

        Text {
            id: helloText
            text: "Goon Clicker!"
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: -70
            font.pointSize: 24
            font.bold: true
        }

        SoundEffect {
            id: clicksound
            source: "qrc:/resources/fahh.wav"
        }

        Text {
            id: goontxt
            text: "Goon Counter: " + root.countval
            anchors.right: parent.right
            anchors.rightMargin: 4
            font.pointSize: 24
            font.bold: true
        }

        Button {
            id: counter
            anchors.centerIn: parent
            width: 100
            visible: (root.countval >= 300 && root.countval < 310) ? !clicksound.playing : true

            onClicked: {
                root.countval += 1

                if (root.countval === 100) {
                    logoimage.source = "qrc:/resources/domer.jpg"
                    clicksound.stop()
                    clicksound.source = "qrc:/resources/domer.wav"
                    clicksound.play()
                }
                else if (root.countval === 200) {
                    logoimage.source = "qrc:/resources/david.jpg"
                    clicksound.stop()
                    clicksound.source = "qrc:/resources/cocoa.wav"
                    clicksound.play()
                }
                else if (root.countval === 300) {
                    logoimage.source = "qrc:/resources/kirk.jpg"
                    clicksound.stop()
                    clicksound.source = "qrc:/resources/shot.wav"
                    clicksound.play()
                }
                else if (root.countval === 400) {
                    logoimage.source = "qrc:/resources/kirky.jpg"
                    clicksound.stop()
                    clicksound.source = "qrc:/resources/boom.wav"
                    clicksound.play()
                    mainui.visible = false
                    endVideo.visible = true
                    endVideo.play()
                }
                else if (root.countval === 500) {
                    logoimage.visible = false
                    colorPicker.visible = false
                    dialogue.visible = true
                    name.text = "Next"
                    clicksound.play()
                }
                else if (root.countval === 501) {
                    yosuke.source = "qrc:/resources/2.png"
                    clicksound.stop()
                    clicksound.source = "qrc:/resources/tindeck.wav"
                    clicksound.play()
                }
                else if (root.countval === 502) {
                    endcredits.play()
                    yosuke.source = "qrc:/resources/3.png"
                    name.text = "End"
                }
                else if (root.countval === 503) {
                    mainui.visible = false
                    dialogue.visible = false
                    end.visible = true
                }
                else if (root.countval > 200 && root.countval < 500) {
                    // Between 201-499 (excluding milestones)
                    clicksound.stop()
                    clicksound.play()
                }
                else if (root.countval < 200) {
                    // Below 200 (excluding 100)
                    clicksound.play()
                }
            }

            contentItem: Text {
                id: name
                text: "Goon"
                font.pointSize: 24
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                color: "grey"
                border.color: "darkgrey"
                radius: 10
                border.width: 1
            }
        }

        Grid {
            id: colorPicker
            x: 4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            rows: 2
            columns: 3
            spacing: 3

            Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "black"; onClicked: helloText.color = cellColor }
        }
    }

    Item {
        id: dialogue
        visible: false
        anchors.fill: parent

        Image {
            id: yosuke
            source: "qrc:/resources/1.png"
            width: parent.width
            fillMode: Image.PreserveAspectFit
            asynchronous: true
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
        }
    }

    Item {
        id: end
        visible: false
        anchors.fill: parent

        Text {
            anchors.centerIn: parent
            text: "The End"
            font.pointSize: 24
            font.bold: true
        }
    }
}