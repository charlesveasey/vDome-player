#include "syscmds.h"
#include <QDir>

Syscmds::Syscmds(QQuickItem *parent) : QQuickItem(parent){
}

void Syscmds::deleteFile(QString filename) {
    QFile::remove(filename);
}

void Syscmds::executeFile() {
    QString path = QCoreApplication::applicationDirPath();
    process.start( path + "/renderer/vdome.app");
}

/* Function to get the OS detail based on which
  qml components can be shown*/

QString Syscmds::getOSName(){
    QString osName = "unknown";

#ifdef Q_OS_MAC
     osName =  "osx";
#endif

#ifdef Q_OS_WIN
     osName =  "win";
#endif

     return osName;
}
