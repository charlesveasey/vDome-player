#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "osc/osc_receiver.h"
#include "osc/osc_sender.h"
#include "playlist.h"
#include "syscmds.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<OSCReceiver>("OSC", 1, 0, "OSCReceiver");
    qmlRegisterType<OSCSender>("OSC", 1, 0, "OSCSender");
    qmlRegisterType<Playlist>("Playlist", 1, 0, "Playlist");
    qmlRegisterType<Syscmds>("Syscmds", 1, 0, "Syscmds");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///qml/main.qml")));

    return app.exec();
}
