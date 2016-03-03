import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

/**************************************************************
 LIBRARY SETTINGS
 **************************************************************/
Item {
    property real imageDuration: 10
    property bool clearPending: false
    property int column2x: 250

    Column {
        x:0; y: 0;
        spacing: columnSpacing;


        Text {
            width: 225;
            color: '#fff'; font.pixelSize: fontSizeHeader; font.family: fontBold; font.bold: true;
            text: qsTr("Library")
        }

        Text {
            width: 200;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Image Duration")

            TextInput{
                id:durationText
                x: column2x;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
                clip: true; activeFocusOnPress: true;  readOnly: false; selectByMouse: true;
                enabled: false; visible: enabled;
                text: secondsToHms(imageDuration);
                onAccepted: {
                    imageDuration = hmsToSeconds(displayText);
                    enabled = false;
                    libraryPanel.updateDurationTmp(imageDuration);
                }
            }

            Text {
                x: column2x; width: 200;
                color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
                visible: !durationText.enabled;
                text: secondsToHms(imageDuration);

                MouseArea{
                    width: parent.width; height: parent.height;
                    onPressed: {
                        durationText.enabled = true;
                        durationText.forceActiveFocus();
                    }
                }
            }
        }




        Text {
            width: 200;
            color: '#fff'; font.pixelSize: fontSizeNormal; font.family: fontRegular;
            text: qsTr("Clear library");

            Button {
                 x: column2x; y: -3; width: 50;
                 text: qsTr("Clear");
                 onClicked: {
                     clearPending = false;
                     clearWarningDialog.open();
                }
             }
        }




        MessageDialog {
            id: clearWarningDialog
            title: "Clear Library"
            text: "Are you sure you want to clear your playlist and media library?"
            standardButtons: StandardButton.Ok | StandardButton.Cancel
            onAccepted: {
                clearPending = true;
                libraryPanel.clear();
                playlistIndexPanel.clear();
            }
            Component.onCompleted: visible = false;
        }




    } // column



 // clear library database and list models
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
