#include "syscmds.h"
#include <QDir>

Syscmds::Syscmds(QQuickItem *parent) : QQuickItem(parent){

}

void Syscmds::deleteFile(QString filename) {
    QFile::remove(filename);

}

void Syscmds::startRenderer() {
    connect(&Process,SIGNAL(stateChanged(QProcess::ProcessState)),this,SLOT(onStarted()));

    QString path = QCoreApplication::applicationDirPath();
        Process.start( QDir::toNativeSeparators((path + "/renderer/vDome.exe")));
}

void Syscmds::closeRenderer() {
    Process.close();
}

void Syscmds::restartRenderer() {
    Process.close();
    Process.start();
}

void Syscmds::onStarted(){
    qDebug () << Process.state();
}


void Syscmds::processExited()
{
     /*if ( Process->exitStatus() == 0)
    {
        qDebug () << "Program ran successfully";
    }
   if ( process->exitStatus() == 2)
    {
        qDebug () << "Customized message";
    }

    if ( process->exitStatus() == 3)
    {
        qDebug () << "Another text warning message";
    }*/
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
