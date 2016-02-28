import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 PROJECTOR SETTINGS
 **************************************************************/
Item{
    anchors.fill: parent.fill;
    property int column2x: 90


    Column{
        x:0; y: 0; width: parent.width;
        spacing: columnSpacing;






        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold;
            text: qsTr("Projector")
        }





        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Menu")

            Switch {
                x: column2x;
                checked: false;
                onCheckedChanged: if (socket) socket.sendProjectorEnable((checked ? "on" : "off"));
            }
        }





    } // column 1



    Column{
        x:0; y: 100; width: parent.width;
        spacing: columnSpacing;


        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontBold;
            text: qsTr("Projector Index")


        }



        Slider {
            id: projectorSlider;
            x: 0; y: 2; width: settings.width-x-settings.sliderInputTextPad
            value: 1; maximumValue: 4.0; stepSize: 1;
            //onValueChanged: if (socket) socket.sendProjectorPolar(polarAzimuthSlider.value*100 + "," + polarElevationSlider.value*100);
            TextInput {
                id: projectorInput;
                x: parent.width+25; y: 2; width: 25;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
                text: projectorSlider.value;
                onAccepted: projectorSlider.value = Number(displayText);
            }
        }




        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Enable")

            Switch {
                x: column2x;
                checked: false;
                onCheckedChanged: if (socket) socket.sendProjectorEnable((checked ? "on" : "off"))
            }
        }






        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Azimuth")

            Slider {
                id: polarAzimuthSlider;
                x: column2x; y: 2; width: settings.width-x-settings.sliderInputTextPad
                value: 1;
                onValueChanged: if (socket) socket.sendProjectorPolar(polarAzimuthSlider.value*100 + "," + polarElevationSlider.value*100);
            }

            TextInput {
                id: polarAzimuthInput;
                x: polarAzimuthSlider.width + settings.sliderInputTextPad;
                y: 2; width: 25;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
                text: Math.round(polarAzimuthSlider.value * 100);
                onAccepted: polarAzimuthSlider.value = (Number(displayText) * 100);
            }
        }






        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Elevation")

            Slider {
                id: polarElevationSlider;
                x: column2x; y: 2; width: settings.width-x-settings.sliderInputTextPad;
                value: 1;
                onValueChanged: if (socket) socket.sendProjectorPolar(polarAzimuthSlider.value*100 + "," + polarElevationSlider.value*100);
            }

            TextInput {
                id: polarElevationInput;
                x: polarElevationSlider.width + settings.sliderInputTextPad; y: 2; width: 25;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
                text: Math.round(polarElevationSlider.value * 100);
                onAccepted: polarElevationSlider.value = (Number(displayText) * 100);
            }
        }




        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Calibrate")

            Switch {
                x: column2x;
                checked: false;
                onCheckedChanged: if (socket) socket.sendProjectorEnable((checked ? "on" : "off"))
            }
        }

    } // column 2



}////////////////////////////////
