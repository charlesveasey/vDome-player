import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 TRANSFORM SETTINGS
 **************************************************************/
Item{

    anchors.fill: parent.fill;
    property int columnOffset: 10;
    property int columnSpacing: 12;






    Column{
        y:0;
        spacing: columnSpacing;
        width: parent.width

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 16
            font.family: openSansExtraBold.name
            text: qsTr("Input")
            font.bold : true;
        }


        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 16
            font.family: openSansExtraBold.name
            text: qsTr("Flip")
            font.bold : false;
            CheckBox {
                id: flipCheckbox2
                width: parent.width;
                height: 20;
                x: 75;
                y: 2
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
                width: settings.width-x-settings.sliderInputTextPad
                value: .5;
                onValueChanged: if(socket) socket.sendScale(value*2.0);
            }

            TextInput {
                id: scaleText;
                x: scaleSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: (Math.round(scaleSlider.value * 2.0 * 100.0) / 100.0).toFixed(2);
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
                width: settings.width-x-settings.sliderInputTextPad
                value: .5
                onValueChanged: if(socket) socket.sendRotate(value * 360 - 180);
            }

            TextInput {
                id: rotateText;
                x: rotateSlider.width + settings.sliderInputTextPad;
                y: 2
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
                width: settings.width-x-settings.sliderInputTextPad
                value: .5;
                onValueChanged: if(socket) socket.sendTilt(value * 360 - 180) ;
            }

            TextInput {
                id: tiltText;
                x: tiltSlider.width + settings.sliderInputTextPad;
                y: 2;
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


