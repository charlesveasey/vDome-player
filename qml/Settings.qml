import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Controls.Styles 1.2

/**************************************************************
 SETTING WINDOW
 **************************************************************/
Window {
    id: root

    title: "Settings"
    width: 400; height: 265
    minimumWidth: 400; minimumHeight: 265;
    color: '#111'
    opacity: 1

    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowSystemMenuHint

    property var settingsObject;

    Component.onCompleted: {
        db.createSettings();
        load();
        if (settingsStartup.launch)
             syscmds.executeFile(settingsStartup.filepath);
    }

    Component.onDestruction: {
        cancel();
    }

    Row{
        x: 20;
        y: 15;
        spacing: 30

        /**************************************************************
         LIBRARY SETTINGS TAB
         **************************************************************/
        TabButton {
            id: settingsTransformTab;
            y: checked ? 0 : 2;
            text: qsTr("Transform")
            hit.width: 65; hit.height: 50; hit.x: -5; hit.y: -25;
            checked: false;
            onClicked: {
                settingsLibraryTab.checked = false;
                settingsSocketTab.checked = false;
                settingsStartupTab.checked = false;
            }
        }

        /**************************************************************
         LIBRARY SETTINGS TAB
         **************************************************************/
        TabButton {
            id: settingsLibraryTab;
            y: checked ? 0 : 2;
            text: qsTr("Libary")
            hit.width: 65; hit.height: 50; hit.x: -5; hit.y: -25;
            checked: false;
            onClicked: {
                settingsTransformTab.checked = false;
                settingsSocketTab.checked = false;
                settingsStartupTab.checked = false;
            }
        }

        /**************************************************************
         SOCKET SETTINGS TAB
         **************************************************************/
        TabButton {
            id: settingsSocketTab;
            y: checked ? 0 : 2;
            text: qsTr("Socket")
            hit.width: 65; hit.height: 50; hit.x: -5; hit.y: -25;
            checked: false;
            onClicked: {
                settingsTransformTab.checked = false;
                settingsLibraryTab.checked = false;
                settingsStartupTab.checked = false;
            }
        }


        /**************************************************************
         STARTUP SETTINGS TAB
         **************************************************************/
        TabButton {
            id: settingsStartupTab;
            y: checked ? 0 : 2;
            text: qsTr("Startup")
            hit.width: 65; hit.height: 50; hit.x: -5; hit.y: -25;
            checked: false;
            onClicked: {
                settingsTransformTab.checked = false;
                settingsLibraryTab.checked = false;
                settingsSocketTab.checked = false;
            }
        }

    }

    /**************************************************************
     SETTINGS TAB CONTAINERS
     **************************************************************/
    Rectangle{
        x: 0;
        y: 55;
        width: parent.width;
        height: parent.height-y*2;
        color: '#212121'

        SettingsTransform{
             id: settingsTransform;
             visible: settingsTransformTab.checked;
             x: 20;
             y: 20;
             z: 5;
        }

        SettingsLibrary{
             id: settingsLibrary;
             visible: settingsLibraryTab.checked;
             x: 20;
             y: 20;
             z: 5;
        }

        SettingsSocket{
            id: settingsSocket;
            visible: settingsSocketTab.checked;
            x: 20;
            y: 20;
            z: 5;
        }

        SettingsStartup{
            id: settingsStartup;
            visible: settingsStartupTab.checked;
            x: 20;
            y: 20;
            z: 5;
        }
    }

    /**************************************************************
     SAVE / CANCEL BUTTONS
     **************************************************************/
    Row{
        spacing: 10;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        anchors.bottomMargin: 15;
        anchors.rightMargin: 20;

        Button {
            width:60;
             text: qsTr("Cancel")
             onClicked: cancel();
         }
        Button {
            width:60;
             text: qsTr("Save")
             onClicked: save();
         }
    }



    /**************************************************************
     SAVE ACTION
     **************************************************************/
    function save(){
        visible = false;

        settingsObject.librarySlide = settingsLibrary.imageDuration;
        settingsObject.socketHost = socket.host;
        settingsObject.socketSend = socket.sendPort;
        settingsObject.socketReceive = socket.receivePort;
        settingsObject.startupLaunch = settingsStartup.launch ? 1 : 0;
        settingsObject.startupFilepath = settingsStartup.filepath;

        db.updateSettings(settingsObject);
        libraryPanel.slide = settingsObject.librarySlide;
        libraryPanel.updateDuration();
        libraryPanel.loadSort();

        if (settingsLibrary.clearPending){
            settingsLibrary.clearLibrary();
        }
    }

    /**************************************************************
     CANCEL ACTION
     **************************************************************/
    function cancel(){
        load();
        libraryPanel.loadSort();
        playlistIndexPanel.loadSort();
        visible = false;
    }


    /**************************************************************
     LOAD SETTINGS FROM DB
     **************************************************************/
    function load(){
        settingsObject = {};
        var rows = db.selectSettings();

        var o = {};
        if (rows.length){
            o = rows[0];

            libraryPanel.slide = o.librarySlide;
            libraryPanel.updateDuration();
            settingsLibrary.imageDuration = o.librarySlide;

            socket.host = o.socketHost;
            socket.sendPort = parseInt(o.socketSend);
            socket.receivePort = parseInt(o.socketReceive);

            settingsStartup.launch = o.startupLaunch ? 1 : 0;
            settingsStartup.filepath = o.startupFilepath == "null" || o.startupFilepath == null ? "" : o.startupFilepath;

            for (var p in  o){
                settingsObject[p] = o[p]
            }


        }
    }

    /**************************************************************
     LOAD SETTINGS FROM DB
     **************************************************************/
    function open(tab){
        if (tab === 'transform'){
            settingsTransformTab.checked = true;
            settingsLibraryTab.checked = false;
            settingsSocketTab.checked = false;
            settingsStartupTab.checked = false;
        }
        else if (tab === 'library'){
            settingsTransformTab.checked = false;
            settingsLibraryTab.checked = true;
            settingsSocketTab.checked = false;
            settingsStartupTab.checked = false;
        }
        else if (tab === 'socket'){
            settingsTransformTab.checked = false;
            settingsLibraryTab.checked = false;
            settingsSocketTab.checked = true;
            settingsStartupTab.checked = false;
        }
        else if (tab === 'startup'){
            settingsTransformTab.checked = false;
            settingsLibraryTab.checked = false;
            settingsSocketTab.checked = false;
            settingsStartupTab.checked = true;
        }
        visible = true;
    }

}
