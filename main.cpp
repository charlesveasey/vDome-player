#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "osc/osc_receiver.h"
#include "osc/osc_sender.h"
#include "playlist.h"
#include "syscmds.h"
#include "xmlParser.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<OSCReceiver>("OSC", 1, 0, "OSCReceiver");
    qmlRegisterType<OSCSender>("OSC", 1, 0, "OSCSender");
    qmlRegisterType<Playlist>("Playlist", 1, 0, "Playlist");
    qmlRegisterType<Syscmds>("Syscmds", 1, 0, "Syscmds");
    qmlRegisterType<XMLParser>("XMLParser", 1, 0, "XMLParser");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///qml/main.qml")));

    //Syscmds syscmds;
    //syscmds.startRenderer();
    return app.exec();
}
