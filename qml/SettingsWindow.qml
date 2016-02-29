import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 WINDOW SETTINGS
 **************************************************************/
Item {

    property int column2x: 300;
    property int column3x: column2x+50;



    // tab header
    Text {
        width: 225;
        color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold; font.bold: true;
        text: qsTr("Window")
    }


    // add remove buttons
    Button {
         text: qsTr("Add")
         x: 0; y: 45; width: 65;

         onClicked: {
                 amodel.append({
                    "index":    settingsWindowList.count+1,
                    "projectorCount":    2
                 })
        }

         Button {
              text: qsTr("Remove")
              x: parent.width+10; y: 0;  width: 65;

              onClicked: {
                  if (settingsWindowList.count > 1){
                     amodel.remove( settingsWindowList.count-1, 1 );
                  }
             }
         }

    }






    // list view component
    Component {
        id: aDelegate

        Column {

            height: 205;
            spacing: columnSpacing;

            // window index
            Text {
                width: 225;
                color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold; font.bold: true;
                text: qsTr("Window " + index)
            }


            // window border
            Text {
                width: 225;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                text: qsTr("Window Border")


                // window border switch
                Switch {
                    x: column2x;
                    checked: false;
                    onCheckedChanged: {
                        if (socket) {
                            //////////////////////////////////////////////////////////////
                           // socket.sendProjectorMenu((checked ? "on" : "off"));
                         }
                    }
                }
            }




            // window position
            Text {
                width: 400;
                color: '#fff'
                font.pixelSize: fontSizeNormal
                font.family: fontRegular
                text: qsTr("Window Position (x,y) ")


                // x
                TextInput{
                    x: column2x; width: 50;
                    color: '#fff';  font.pixelSize: fontSizeNormal; font.family: fontRegular; horizontalAlignment:  Text.AlignLeft;
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: "0";
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
                }

                // y
                TextInput{
                    x: column3x; y: 0; width: 50;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true; activeFocusOnPress: true; readOnly: false;  selectByMouse: true;
                    enabled: true; visible: true;
                    text: "0";
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
                }
            }




            // projector count
            Text {
                width: 225;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                text: qsTr("Projector Count ")


                // input projector count
                TextInput{
                    x: column2x;  width: 50;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true;  activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: projectorCount;
                    onAccepted: {
                        //////////////////////////////////
                       // onAccepted: projectorCount = displayText;
                    }
                }


            }



            // projector resolution
            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: fontSizeNormal
                font.family: fontRegular
                text: qsTr("Projector Resolution (w,h)")

                // width
                TextInput{
                    x: column2x; y: 0; width: 50;
                    color: '#fff';  font.pixelSize: fontSizeNormal; font.family: fontRegular; horizontalAlignment:  Text.AlignLeft;
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true;  visible: true;
                    text: "1024";
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
               }

                // height
                TextInput{
                    x: column3x; y: 0; width: 50;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: "768";
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
                }

            }



         } // column




    } // component




    ListModel {
        id: amodel
        ListElement {
            index: 1
            projectorCount: 1
        }
    }



     ListView {
         id: settingsWindowList;
         y:100; width: 700; height: settings.height
         model: amodel
         delegate: aDelegate
     }




}
