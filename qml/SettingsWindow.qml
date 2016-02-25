import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 TRANSFORM SETTINGS
 **************************************************************/
Item {
    anchors.fill: parent.fill;
    property int column2x: 250





    Button {
         text: qsTr("Add")
         x: settings.width - 180;
         y: 0

         width: 65;
         onClicked: {
        }
    }






    Button {
         text: qsTr("Remove")
         x: settings.width - 105;
         y: 0

         width: 65;
         onClicked: {
        }
    }




    Component {
        id: aDelegate
        Column {
            spacing: 12;

            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: 16
                font.family: openSansExtraBold.name
                text: qsTr("Window " + index)
                font.bold : true;
            }


            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                text: qsTr("Projector Count ")


                TextInput{
                    id:pText
                    x: 255
                    width: 35
                    color: '#fff'
                    text: "6";
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    clip: true;
                    activeFocusOnPress: true
                    readOnly: false;
                    selectByMouse: true;
                    enabled: true;
                    visible: true;
                    onAccepted: {
                        enabled = false;
                        projectorCount = displayText;
                        //socket.host = displayText;
                    }
                }


            }




            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                text: qsTr("Projector Resolution (w,h)")

                TextInput{
                    id:bText
                    x: column2x;
                    width: 35
                    color: '#fff'
                    text: "0";
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    clip: true;
                    activeFocusOnPress: true
                    readOnly: false;
                    selectByMouse: true;
                    enabled: true;
                    visible: true;
                    horizontalAlignment:  Text.AlignRight;
                    onAccepted: {
                        projectorCount = displayText;
                        //socket.host = displayText;
                    }
                }

                Text {
                    x: column2x+35;
                    width: 50;
                    color: '#fff'
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    text: qsTr(" , ")
                }


                TextInput{
                    id:cText
                    x: column2x+50;
                    width:225
                    color: '#fff'
                    text: "1000";
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    clip: true;
                    activeFocusOnPress: true
                    readOnly: false;
                    selectByMouse: true;
                    enabled: true;
                    visible: true;
                    onAccepted: {
                        projectorCount = displayText;
                        //socket.host = displayText;
                    }
                }

            }





            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                text: qsTr("Window Position (x,y) ")
                height: 50

                TextInput{
                    id:hostText
                    x: column2x;
                    width:35
                    color: '#fff'
                    text: "0";
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    clip: true;
                    activeFocusOnPress: true
                    readOnly: false;
                    selectByMouse: true;
                    enabled: true;
                    visible: true;
                    horizontalAlignment:  Text.AlignRight;
                    onAccepted: {
                        projectorCount = displayText;
                        //socket.host = displayText;
                    }
                }

                Text {
                    x: column2x+35;
                    width: 35;
                    color: '#fff'
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    text: qsTr(" , ")
                }


                TextInput{
                    id:nText
                    x: column2x+50;
                    width:35
                    color: '#fff'
                    text: "0";
                    font.pixelSize: 14
                    font.family: openSansExtraBold.name
                    clip: true;
                    activeFocusOnPress: true
                    readOnly: false;
                    selectByMouse: true;
                    enabled: true;
                    visible: true;
                    onAccepted: {
                        projectorCount = displayText;
                        //socket.host = displayText;
                    }
                }

            }


         }



    }

    ListModel {
        id: amodel
        ListElement {
            index: 1
            projectorCount: 3
        }
        ListElement {
            index: 2
            projectorCount: 3
        }
    }



     ListView {
         width: 400
         height: 400
         y: 0
         model: amodel
         delegate: aDelegate
     }




}
