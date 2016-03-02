#include "syscmds.h"
#include <QDir>

Syscmds::Syscmds(QQuickItem *parent) : QQuickItem(parent){

}

void Syscmds::deleteFile(QString filename) {
    QFile::remove(filename);

    //QObject::connect(&Process, SIGNAL(finished(int,QProcess::ExitStatus)),
     //                   this,SLOT(processExited()));
}

void Syscmds::startRenderer() {



    //QString path = QCoreApplication::applicationDirPath();
    //process.start( path + "/Users/Charles/Code/openFrameworks/apps/myApps/vDome/bin/vdome.app");
    //process.start( "/Users/Charles/Code/openFrameworks/apps/myApps/vDome/bin/vDome.app");




    //Process.setProgram("/Applications/VLC.app");
    //Process.waitForFinished();

    //Process.startDetached();


    //connect(&Process,SIGNAL(stateChanged(QProcess::ProcessState)),this,SLOT(onStarted()));

}

void Syscmds::closeRenderer() {
    Process.close();
    //Process.terminate();
    //Process.waitForFinished();
}

void Syscmds::restartRenderer() {
    //Process.reset();
    Process.start();
    //Process.start("/Applications/VLC.app");

}

void Syscmds::onStarted(){
    qDebug () << Process.state();

}


void Syscmds::processExited()
{





     /*if ( Process->exitStatus() == 0)
    {
        qDebug () << "Program ran successfully";



        //startRenderer();

        //process->setProcessState(ProcessState::NotRunning);//Specify the process is no longer running
        //waitpid(process->pid(),NULL,WNOHANG);
    }
   if ( process->exitStatus() == 2)
    {
        qDebug () << "Customized message";
    }

    if ( process->exitStatus() == 3)
    {
        qDebug () << "Another text warning message";
    }*/




    //process->waitForFinished(1000);
    //process->kill();
    //delete process;
    //Process->waitForFinished();




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
