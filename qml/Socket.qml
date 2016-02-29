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
    property  real seekValue: -1;

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
                    if (msg == "-inf"){
                        return
                    }
                   if (Number.fromLocaleString(msg) === null)
                        controlPanel.positionValue = 0;
                   else
                       controlPanel.positionValue = Number.fromLocaleString (msg);

                    controlPanel.time = secondsToHms(controlPanel.cDuration* Number.fromLocaleString (msg));

                   if (controlPanel.positionValue*controlPanel.duration >= controlPanel.duration){
                        playlistPanel.next();
                   }
                }
            }
            else if (address == "/input/duration") {
                var file = msg.split(",")[0];
                var dur = parseFloat(msg.split(",")[1]);
                controlPanel.cDuration = parseFloat(dur);

                db.updateLibraryItemDuration(file, dur)
                libraryPanel.loadSort();

                var c;
                for (var i=0; i<playlistPanel.getCount(); i++){
                    c = playlistPanel.getFileByIndex(i);

                    if (c === plist.convertToNativePath(file)){
                        playlistPanel.setProperty(i, "duration", dur);
                        playlistPanel.sumPlaylistDuration();
                    }
                }
            }
            else if (address == "/input/" && msg == "end")  {
                controlPanel.end();
            }
        }
    }



    /**************************************************************
     SEND FUNCTIONS
     **************************************************************/

    function send(address, msg){
       oscSend.send(address, msg);
    }


    // input
    function sendSource(value){
       send("/input/source/", value);
    }

    function sendFile(filepath){
        send("/input/file/", filepath);
    }

    function sendPlay(){
        send("/input/", "play");
    }

    function sendPause(){
       send("/input/", "stop");
    }

    function sendSeek(pos){
       seekValue = pos;
       send("/input/seek/", pos);
    }

    function sendVolume(vol){
       send("/input/volume/", vol);
    }

    function sendLoop(value){
       send("/input/loop/", value);
    }

    function sendFormat(value){
       send("/input/format/", value);
    }
    function sendFlip(value){
       send("/input/flip/", value);
    }
    function sendRotate(value){
       send("/input/rotate/", value);
    }
    function sendScale(value){
       send("/input/scale/", value);
    }
    function sendTilt(value){
       send("/input/tilt/", value);
    }

    // projector
    function sendProjectorMenu(value){
        send("/projector/menu/", value)
    }
    function sendProjectorEnable(value){
        send("/projector/enable/", value)
    }
    function sendProjectorPolar(value){
        send("/projector/polar/", value)
    }

    // focus
    function sendAppFocus(value){
        send("/projector/focus/", value)
    }


}
