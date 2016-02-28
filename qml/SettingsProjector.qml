import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 PROJECTOR SETTINGS
 **************************************************************/
Item{
    anchors.fill: parent.fill;
    property  int headerSize: 16
    property int column2x: 90
    property int columnOffset: 10
    property int columnSpacing: 12

    function map (in_val, in_min, in_max, out_min, out_max) {
      return (in_val - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
    }


    /**************************************************************
     PROJECTOR
     **************************************************************/
    Column{
        y: 0;
        spacing: columnSpacing;
        width: parent.width

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: headerSize
            font.family: openSansExtraBold.name
            text: qsTr("Projector")
            font.bold : true;
        }
        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Index")

            TextInput {
                id: indexText;
                x: settings.sliderInputTextPad-5;
                y: 1
                width: 25;
                color: '#fff'
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                font.bold : true;
                text: "1"
                onAccepted: {
                    socket.sendProjectorIndex(Number(displayText));
                }
            }
        }


        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Enable")
            font.bold : false;

            CheckBox {
                id: flipCheckbox
                width: parent.width;
                height: 20;
                x: column2x;
                y: 1
                checked: true
                onCheckedChanged: socket.sendProjectorEnable((checked ? "on" : "off"));
            }
        }






        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Menu")
            font.bold : false;

            CheckBox {
                id: flipCheckbox2
                width: parent.width;
                height: 20;
                x: column2x;
                y: 1
                checked: true
                onCheckedChanged: socket.sendProjectorEnable((checked ? "on" : "off"));
            }
        }



        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Azimuth")

            Slider {
                id: polarAzimuthSlider;
                 x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1;
                onValueChanged: if(socket) socket.sendProjectorPolar(polarAzimuthSlider.value*100 + "," + polarElevationSlider.value*100);
            }

            TextInput {
                id: polarAzimuthInput;
                x: polarAzimuthSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(polarAzimuthSlider.value * 100)
                onAccepted: {
                    polarAzimuthSlider.value = (Number(displayText) * 100)
                }
            }
        }



        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Elevation")

            Slider {
                id: polarElevationSlider;
                x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1;
                onValueChanged: if(socket) socket.sendProjectorPolar(polarAzimuthSlider.value*100 + "," + polarElevationSlider.value*100);
            }

            TextInput {
                id: polarElevationInput;
                x: polarElevationSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(polarElevationSlider.value * 100)
                onAccepted: {
                    polarElevationSlider.value = (Number(displayText) * 100)
                }
            }
        }



    }





}////////////////////////////////
