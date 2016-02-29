import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 WINDOW SETTINGS
 **************************************************************/
Item {
    property int column2x: 250




    Text {
        width: 225;
        color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold; font.bold: true;
        text: qsTr("Window")
    }


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









    Component {
        id: aDelegate

        Column {
            spacing: columnSpacing;

            Text {
                width: 225;
                color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold; font.bold: true;
                text: qsTr("Window " + index)
            }


            Text {
                width: 225;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                text: qsTr("Projector Count ")


                TextInput{
                    id:pText
                    x: 255;  width: 35
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true;  activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: projectorCount;
                    onAccepted: {
                        enabled = false;
                        projectorCount = displayText;
                    }
                }


            }




            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: fontSizeNormal
                font.family: fontRegular
                text: qsTr("Projector Resolution (w,h)")

                TextInput{
                    id:bText
                    x: column2x; width: 35
                    color: '#fff';  font.pixelSize: fontSizeNormal; font.family: fontRegular; horizontalAlignment:  Text.AlignRight;
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true;  visible: true;
                    text: "1024";
                    onAccepted: projectorCount = displayText;
               }

                Text {
                    x: column2x+35; width: 50;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    text: qsTr(" , ")
                }


                TextInput{
                    id:cText
                    x: column2x+50;  width:225
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: "768";
                    onAccepted: projectorCount = displayText;
                }

            }





            Text {
                width: 225;
                color: '#fff'
                font.pixelSize: fontSizeNormal
                font.family: fontRegular
                text: qsTr("Window Position (x,y) ")
                height: 50

                TextInput{
                    id:hostText
                    x: column2x; width: 35
                    color: '#fff';  font.pixelSize: fontSizeNormal; font.family: fontRegular; horizontalAlignment:  Text.AlignRight;
                    clip: true; activeFocusOnPress: true; readOnly: false; selectByMouse: true;
                    enabled: true; visible: true;
                    text: "0";

                    onAccepted: {
                        projectorCount = displayText;
                    }
                }

                Text {
                    x: column2x+35;
                    width: 35;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    text: qsTr(" , ")
                }


                TextInput{
                    id:nText
                    x: column2x+50; width:35;
                    color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular
                    clip: true; activeFocusOnPress: true; readOnly: false;  selectByMouse: true;
                    enabled: true; visible: true;
                    text: "0";
                    onAccepted: projectorCount = displayText;
                }
            }


         } // column


    } // component




    ListModel {
        id: amodel
        ListElement {
            index: 1
            projectorCount: 3
        }
    }



     ListView {
         id: settingsWindowList;
         y:100; width: 400; height: settings.height
         model: amodel
         delegate: aDelegate
     }




}
