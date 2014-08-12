import QtQuick 2.2
import OSC 1.0

/**************************************************************
 OSC SOCKET
 **************************************************************/
Item {
    id: root
    property string host: "localhost"
    property real sendPort: 3334;
    property real receivePort: 3333;
    property string address: "";

    /**************************************************************
     OSC SEND
     **************************************************************/
    OSCSender {
        id: oscSend
        ip: host
        port: sendPort
    }

    /**************************************************************
     OSC RECEIVE
     **************************************************************/
    OSCReceiver {
        id: oscReceive
        port: receivePort
        property real duration: 0;

        onMessage: {
            if (address == "/input/position") {
                if (controlPanel.cType == "video") {
                    controlPanel.positionValue = msg;
                    controlPanel.time = secondsToHms(controlPanel.cDuration*msg);
                    if (controlPanel.positionValue*controlPanel.duration >= controlPanel.duration){
                        playlistPanel.next();
                    }
                }
            }
            else if (address == "/input/duration") {
                var file = msg.split(",")[0];
                file = Qt.resolvedUrl(file)
                file = plist.convertPath(file);
                var dur =  parseFloat(msg.split(",")[1]);
                controlPanel.cDuration = parseFloat(dur);
                controlPanel.time = secondsToHms(controlPanel.duration);
                db.updateLibraryItemDuration(msg.split(",")[0], dur)
                libraryPanel.loadSort();
                var c;
                for (var i=0; i<playlistPanel.getCount(); i++){
                    c = playlistPanel.getFileByIndex(i);
                    if (c == msg.split(",")[0])
                        playlistPanel.setProperty(i, "duration", dur);
                }
            }
            else if (address == "/input/" && msg == "end")  {
                controlPanel.end();
            }
        }
    }

    /**************************************************************
     SEND
     **************************************************************/
    function send(address, msg){
       oscSend.send(address, msg);
    }

    /**************************************************************
     SEND SOURCE
     **************************************************************/
    function sendSource(value){
       send("/input/source/", value);
    }

    /**************************************************************
     SEND FILE
     **************************************************************/
    function sendFile(filepath){
        send("/input/file/", filepath);
    }

    /**************************************************************
     SEND PLAY
     **************************************************************/
    function sendPlay(){
       send("/input/", "play");
    }

    /**************************************************************
     SEND PAUSE
     **************************************************************/
    function sendPause(){
       send("/input/", "stop");
    }

    /**************************************************************
     SEND SEEK
     **************************************************************/
    function sendSeek(pos){
       send("/input/seek/", pos);
    }

    /**************************************************************
     SEND VOLUME
     **************************************************************/
    function sendVolume(vol){
       send("/input/volume/", vol);
    }

    /**************************************************************
     SEND LOOP
     **************************************************************/
    function sendLoop(value){
       send("/input/loop/", value);
    }

}
