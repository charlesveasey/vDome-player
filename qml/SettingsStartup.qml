import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.1

/**************************************************************
 STARTUP SETTINGS
 **************************************************************/
Item{
    property alias launch: launchCheckBox.checked;
    property alias filepath: filepathText.text;

    anchors.fill: parent.fill;

    Row{
        spacing: 20;
        y: 20;

        width: 400

        Text {
            width: 225;
            height: 100;

            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("Launch vDome on startup: ")
        }


        CheckBox {
            id: launchCheckBox
            width: 20;
            height: 20;
        }

    }
    Item{

        y: 50;

        width: parent.width
        height: 200;


        Text {
            y: 15
            width: 25;

            color: '#fff'
            font.pixelSize: 14
            font.family: openSansExtraBold.name
            text: qsTr("vDome file path: ")
        }

        Text {
            id: filepathText;
            y: 38;
            width: 215

            wrapMode: Text.WrapAnywhere;
            color: '#fff'
            font.pixelSize: 10
            font.family: openSansSemibold.name
            text: qsTr("")

        }


        Button {
            y: 18
            x: 242
            width: 60;

             text: qsTr("Browse")
             z: 1000;
             onClicked: {
                 filepathBrowse.open();
             }


             FileDialog {
                 id: filepathBrowse
                 title: "Select the vDome executable file"
                 selectMultiple: false;
                 selectFolder: false;
                 onAccepted: {
                     filepath = plist.convertPath(fileUrl);
                 }
             }
         }



    }
}


