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
                x:  settings.sliderInputTextPad-5;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: "1"
                onAccepted: {
                    indexSlider.value = Number(displayText);
                }
            }
        }
    }



    /**************************************************************
     ENABLE
     **************************************************************/
    Column{
        y: columnOffset + 65;
        spacing: columnSpacing;

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: headerSize
            font.family: openSansExtraBold.name
            text: qsTr("Enable")
            font.bold : true;

            CheckBox {
                id: flipCheckbox
                width: parent.width;
                height: 20;
                x: column2x;
                y: 1
                //onCheckedChanged: socket.sendFlip((checked ? "on" : "off"));
            }
        }
    }


    /**************************************************************
     VIEW
     **************************************************************/
    Column{
        y: columnOffset + 90;
        spacing: columnSpacing;

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: headerSize
            font.family: openSansExtraBold.name
            text: qsTr("View")
            font.bold : true;
        }

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Fov")

            Slider {
                id: scaleSlider;
                x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1
                //onValueChanged: if(socket) socket.sendScale(value*2.0);
            }
            TextInput {
                id: scaleText;
                x: scaleSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(scaleSlider.value * 100)
                onAccepted: {
                    scaleSlider.value = Number(displayText) / 2.0;
                }
            }
        }
    }


    /**************************************************************
     WARP
     **************************************************************/
    Column{
        y: columnOffset + 200;
        spacing: columnSpacing;

        Text {
            font.bold : true;
            y:10;
            width: 225;
            color: '#fff'
            font.pixelSize: headerSize
            font.family: openSansExtraBold.name
            text: qsTr("Warp")
        }

        Text {
            width: 150;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Grid X")

            Slider {
                id: gridXSlider;
                x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1
                //onValueChanged: if(socket) socket.sendRotate(value * 10); //fix
            }

            TextInput {
                id: gridXText;
                x: gridXSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round( map(gridXSlider.value, 0, 1, 1, 10) );
                onAccepted: {
                    gridXSlider.value = map (Number(displayText), 1, 10, 0, 1);
                }
            }
        }

        Text {
            width: 150;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Grid Y")

            Slider {
                id: gridYSlider;
                x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1
                //onValueChanged: if(socket) socket.sendRotate(value * 10); //fix
            }

            TextInput {
                id: gridYText;
                x: gridYSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round( map(gridYSlider.value, 0, 1, 1, 10) );
                onAccepted: {
                    gridYSlider.value = map (Number(displayText), 1, 10, 0, 1);
                }
            }
       }

    }




    /**************************************************************
     BLEND
     **************************************************************/
    Column{
        y: columnOffset + 300;
        spacing: columnSpacing;

        Text {
            font.bold : true;
            width: 225;
            color: '#fff'
            font.pixelSize: headerSize
            font.family: openSansExtraBold.name
            text: qsTr("Blend")
        }

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Brightness")

            Slider {
                id: brightnessSlider;
                 x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1
                //onValueChanged: if(socket) socket.sendRotate(value * 100);
            }

            TextInput {
                id: brightnessText;
                x: brightnessSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(brightnessSlider.value * 100)
                onAccepted: {
                    brightnessSlider.value = Number(displayText) * 100
                }
            }
        }

        Text {
            width: 150;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Contrast")

            Slider {
                id: contrastSlider;
                 x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1
                //onValueChanged: if(socket) socket.sendRotate(value * 100); //fix
            }

            TextInput {
                id: contrastText;
                x: contrastSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(contrastSlider.value * 100);
                onAccepted: {
                    contrastSlider.value = (Number(displayText) * 100);
                }
            }
        }

    }






    /**************************************************************
     COLOR
     **************************************************************/

    Column{
        spacing: columnSpacing;
        y: columnOffset + 400;

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: headerSize
            font.family: openSansExtraBold.name
            text: qsTr("Color")
            font.bold : true;

        }
        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Saturation")

            Slider {
                id: saturationSlider;
                 x: column2x;
                y: 2;
                width: settings.width-x-settings.sliderInputTextPad
                value: 1;
                //onValueChanged: if(socket) socket.sendScale(value*100);
            }

            TextInput {
                id: saturationInput;
                x: saturationSlider.width + settings.sliderInputTextPad;
                y: 2
                width: 25;
                color: '#fff'
                font.pixelSize: 12
                font.family: openSansExtraBold.name
                text: Math.round(saturationSlider.value * 100)
                onAccepted: {
                    saturationSlider.value = (Number(displayText) * 100)
                }
            }
        }



        /**************************************************************
         CURVE
         **************************************************************/
        Item{

            Text { id: curveHeader; y: 60;
                color: "#ffffff"
                opacity: curveItem.enabled ? 1.0 : 0.5
                text: qsTr("Curve")
                font.pixelSize: 12
                font.family: openSansExtraBold.name;
            }

            TextButton {
                id: curveItem; x:column2x; y: curveHeader.y;
                color: "#ffffff"
                opacity: enabled ? 1.0 : 0.5
                text: qsTr("grey")
                hit.width: 90; hit.height: 25; hit.x: 0; hit.y: 0;
                onClicked: {
                    curveItem.visible = false;
                    curveItems.visible = true;
                }
            }

            SelectionPanel {
                id: curveItems; x:column2x-25; y:30;
                visible: false
                width: 100
                height: 125
                itemHeight: 20

                Component.onCompleted: {
                    model.append({ name: 'grey'});
                    model.append({ name: 'red' });
                    model.append({ name: 'green' });
                    model.append({ name: 'blue' });
                    selectedItem = 'grey';
                }

                onSelectionPopup: {
                    //root.selectionPopup();
                }
                onClicked: {
                    curveItem.text = selectedItem;
                    curveItem.visible = true;
                    curveItems.visible = false;
                    /*if (selectedItem == "grey") {
                        socket.sendFormat("grey");
                    }
                    else if (selectedItem == "red") {
                        socket.sendFormat("red");
                    }*/
                }

                onExited: {
                    curveItem.visible = true;
                }
            }


        }


    }



}////////////////////////////////
