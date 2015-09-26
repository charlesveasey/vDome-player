import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

/**************************************************************
 LIBRARY SETTINGS
 **************************************************************/
Item {
    property real imageDuration: 10;
    property bool clearPending: false;

    Row {

        y: 20
        spacing: 40;

        width: 400
        height: 125;

        Text {
            width: 200;
            text: qsTr("Image duration:")
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
        }

        TextInput{
            id:durationText
            x: 200;
            color: '#fff'
            text: secondsToHms(imageDuration);
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            clip: true;
            activeFocusOnPress: true
            readOnly: false;
            selectByMouse: true;
            enabled: false;
            visible: enabled;
            onAccepted: {
                imageDuration = hmsToSeconds(displayText);
                enabled = false;
                libraryPanel.updateDurationTmp(imageDuration);
            }
        }
        Text {
            width: 200;
            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: secondsToHms(imageDuration);
            x: 200;
            visible: !durationText.enabled;

            MouseArea{
                width: parent.width;
                height: parent.height;
                onPressed: {
                    durationText.enabled = true;
                    durationText.forceActiveFocus();
                }
            }

        }
    }


    Column {
        x: 0
        y: 75
       spacing: 8;


       Text {
           width: 200;
           text: qsTr("Clear library")
           color: '#fff'
           font.pixelSize: 14
           font.family: openSansExtraBold.name

           Button {
                text: qsTr("Clear")
                x: 240;
                y: -3

                width: 50;
                onClicked: {
                    clearPending = false;
                    clearWarningDialog.open();
               }
            }
       }


       /**************************************************************
        CLEAR WARNING DIALOG
        **************************************************************/
       MessageDialog {
           id: clearWarningDialog
           title: "Clear Library"
           text: "Are you sure you want to clear your library of media and playlists?"
           standardButtons: StandardButton.Yes | StandardButton.No
           onYes: {
               clearPending = true;
               libraryPanel.clear();
               playlistIndexPanel.clear();
           }
           Component.onCompleted: visible = false;
       }


       /*
       Text {
           width: 200;
           text: qsTr("Import library")
           color: '#fff'
           font.pixelSize: 14
           font.family: openSansExtraBold.name

           Button {
               text: qsTr("Import")
               x: 250;
               y: -6

               width: 50;
              // onClicked:
           }
       }



       Text {
           width: 200;
           text: qsTr("Export library")
           color: '#fff'
           font.pixelSize: 14
           font.family: openSansExtraBold.name

           Button {
               text: qsTr("Export")
               x: 250;
               y: -6
               width: 50;
               //onClicked:
           }
       }
       */

    }


    function clearLibrary(){
        libraryPanel.clear();
        playlistIndexPanel.clear();
        db.dropLibrary()
        db.dropPlaylist();
        db.dropPlaylistIndex();
        db.createLibrary();
        db.createPlaylist();
        db.createPlaylistIndex();
        clearPending = false;
    }


}
