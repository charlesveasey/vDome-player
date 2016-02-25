import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1

/**************************************************************
 SOCKET SETTINGS
 **************************************************************/
Item{
    anchors.fill: parent.fill;
    property int columnOffset: 10
    property int columnSpacing: 12
    property int column2x: 250

    Column{
        y: columnOffset
        spacing: columnSpacing;
        width: parent.width

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 16
            font.family: openSansExtraBold.name
            text: qsTr("Library")
            font.bold : true;
        }
    }

    Column{
        y: columnOffset + 45
        spacing: columnSpacing;
        width: 400
        height: 100;

        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Host IP")

            TextInput{
                id:hostText
                x: column2x;
                width:225
                color: '#fff'
                text: socket.host;
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                clip: true;
                activeFocusOnPress: true
                readOnly: false;
                selectByMouse: true;
                enabled: false;
                visible: enabled;
                onAccepted: {
                    enabled = false;
                    socket.host = displayText;
                }
            }
            Text {
                id:hostTextT;
                width: hostText.width;
                color: hostText.color;
                font.pixelSize: hostText.font.pixelSize;
                font.family: hostText.font.family;
                text: hostText.text;
                x: hostText.x;
                y: hostText.y;
                visible: !hostText.enabled;

                MouseArea{
                    width: parent.width;
                    height: parent.height;
                    onPressed: {
                        hostText.enabled = true;
                        hostText.forceActiveFocus();
                    }
                }
            }
        }



        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Send Port")


            TextInput{
                id:sendPortText
                x: column2x;
                width:225
                color: '#fff'
                text: socket.sendPort;
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                clip: true;
                activeFocusOnPress: true
                readOnly: false;
                selectByMouse: true;
                enabled: false;
                visible: enabled;
                onAccepted: {
                    enabled = false;
                    socket.sendPort = displayText;
                }
            }
            Text {
                id:sendPortTextT;
                width: sendPortText.width;
                color: sendPortText.color;
                font.pixelSize: sendPortText.font.pixelSize;
                font.family: sendPortText.font.family;
                text: sendPortText.text;
                x: sendPortText.x;
                y: sendPortText.y;
                visible: !sendPortText.enabled;

                MouseArea{
                    width: parent.width;
                    height: parent.height;
                    onPressed: {
                        sendPortText.enabled = true;
                        sendPortText.forceActiveFocus();
                    }
                }

            }
        }


        Text {
            width: 225;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Receive port:")

            TextInput{
                id:receivePortText
                x: column2x;
                width:225
                color: '#fff'
                text: socket.receivePort;
                font.pixelSize: 14
                font.family: openSansExtraBold.name
                clip: true;
                activeFocusOnPress: true
                readOnly: false;
                selectByMouse: true;
                enabled: false;
                visible: enabled;
                onAccepted: {
                    enabled = false;
                    socket.receivePort = displayText;
                }
            }

            Text {
                id:receivePortTextT;
                width: receivePortText.width;
                color: receivePortText.color;
                font.pixelSize: receivePortText.font.pixelSize;
                font.family: receivePortText.font.family;
                text: receivePortText.text;
                x: receivePortText.x;
                y: receivePortText.y;
                visible: !receivePortText.enabled;

                MouseArea{
                    width: parent.width;
                    height: parent.height;
                    onPressed: {
                        receivePortText.enabled = true;
                        receivePortText.forceActiveFocus();
                    }
                }

            }

        }




    }
}
