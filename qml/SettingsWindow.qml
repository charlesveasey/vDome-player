import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 WINDOW SETTINGS
 **************************************************************/
Item {

    id: windowSettings;
    property int column2x: 300;
    property int column3x: column2x+50;
    property var model: model;
    property var projectorCount: 0;

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
                 model.append({
                    "index":         list.count+1,
                    "border":        false,
                    "positionX":     0,
                    "positionY":     0,
                    "count":         1,
                    "resolutionX":   1024,
                    "resolutionY":   768

                 })
        }

         Button {
              text: qsTr("Remove")
              x: parent.width+10; y: 0;  width: 65;

              onClicked: {
                  if (list.count > 1){
                     model.remove( list.count-1, 1 );
                  }
             }
         }

    }






    // list view component
    Component {
        id: delgate


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
                    checked: border;
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
                    text: positionX;
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
                }

                // y
                TextInput{
                    x: column3x; y: 0; width: 50;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true; activeFocusOnPress: true; readOnly: false;  selectByMouse: true;
                    enabled: true; visible: true;
                    text: positionY;
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
                    text: count;
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
                    text: resolutionX;
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
               }

                // height
                TextInput{
                    x: column3x; y: 0; width: 50;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: resolutionY;
                    //////////////////////////////////
                   // onAccepted: projectorCount = displayText;
                }

            }



         } // column




    } // component




    ListModel {
        id: model
    }



     ListView {
         id: list;
         y:100; width: 700; height: settings.height
         model: model
         delegate: delgate

          Component.onCompleted: {
              xml.loadSettings();
          }
     }





}
