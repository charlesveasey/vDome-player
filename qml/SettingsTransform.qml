import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 TRANSFORM SETTINGS
 **************************************************************/
Item{

    anchors.fill: parent.fill;

    Column{
        spacing: 12;
        width: parent.width

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Flip")

            CheckBox {
                id: flipCheckbox
                width: parent.width;
                height: 20;
                x: 75;
                onCheckedChanged: socket.sendFlip((checked ? "on" : "off"));
            }
        }

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Scale")

            Slider {
                id: scaleSlider;
                x: 75;
                y: 2;
                width:225;
                value: .5;
                onValueChanged: if(socket) socket.sendScale(value*2.0);
            }

            TextInput {
                id: scaleText;
                x: 325;
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(scaleSlider.value * 2.0 * 100.0) / 100.0;
                onAccepted: {
                    scaleSlider.value = Number(displayText) / 2.0;
                }
            }
        }

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Rotate")

            Slider {
                id: rotateSlider;
                x: 75;
                y: 2;
                width:225;
                value: .5
                onValueChanged: if(socket) socket.sendRotate(value * 360 - 180);
            }

            TextInput {
                id: rotateText;
                x: 325;
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(rotateSlider.value * 360 - 180);
                onAccepted: {
                    rotateSlider.value = (Number(displayText) + 180) / 360;
                }
            }
        }

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Tilt")

            Slider {
                id:tiltSlider;
                x: 75;
                y: 2;
                width:225;
                value: .5;
                onValueChanged: if(socket) socket.sendTilt(value * 360 - 180) ;
            }

            TextInput {
                id: tiltText;
                x: 325;
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(tiltSlider.value * 360 - 180);
                onAccepted: {
                    tiltSlider.value = (Number(displayText) + 180) / 360;
                }
            }


        }

    }
}


