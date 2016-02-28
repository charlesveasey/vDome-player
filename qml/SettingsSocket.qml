import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1

/**************************************************************
 SOCKET SETTINGS
 **************************************************************/
Item{
    anchors.fill: parent.fill;
    property int columnOffset: 10;
    property int column2x: 250;

    Column{
        y: 0; width: 400; height: 100;
        spacing: columnSpacing;


        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold;
            text: qsTr("Socket")
        }

        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Host IP")

            TextInput{
                id:hostText
                x: column2x; width:225;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                enabled: false; visible: enabled;
                text: socket.host;
                onAccepted: {
                    enabled = false;
                    socket.host = displayText;
                }
            }

            Text {
                id:hostTextT;
                x: hostText.x; y: hostText.y;  width: hostText.width;
                color: hostText.color;  font.pixelSize: hostText.font.pixelSize; font.family: hostText.font.family;
                visible: !hostText.enabled;
                text: hostText.text;

                MouseArea{
                    width: parent.width; height: parent.height;
                    onPressed: {
                        hostText.enabled = true;
                        hostText.forceActiveFocus();
                    }
                }
            }
        }



        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Send Port")


            TextInput{
                id:sendPortText
                x: column2x; width:225;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                enabled: false; visible: enabled;
                text: socket.sendPort;
                onAccepted: {
                    enabled = false;
                    socket.sendPort = displayText;
                }
            }
            Text {
                id:sendPortTextT;
                x: sendPortText.x; y: sendPortText.y; width: sendPortText.width;
                color: sendPortText.color; font.pixelSize: sendPortText.font.pixelSize; font.family: sendPortText.font.family;
                visible: !sendPortText.enabled;
                text: sendPortText.text;

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
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Receive port:")

            TextInput{
                id:receivePortText
                x: column2x; width:225
                color: '#fff'; font.pixelSize: fontSizeNormal;  font.family: fontRegular
                clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                enabled: false; visible: enabled;
                text: socket.receivePort;
                onAccepted: {
                    enabled = false;
                    socket.receivePort = displayText;
                }
            }

            Text {
                id:receivePortTextT;
                x: receivePortText.x; y: receivePortText.y; width: receivePortText.width;
                color: receivePortText.color; font.pixelSize: receivePortText.font.pixelSize; font.family: receivePortText.font.family;
                visible: !receivePortText.enabled;
                text: receivePortText.text;

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
