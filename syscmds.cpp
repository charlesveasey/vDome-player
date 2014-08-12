#include "syscmds.h"

Syscmds::Syscmds(QQuickItem *parent) : QQuickItem(parent){
}

void Syscmds::deleteFile(QString filename) {
    QFile::remove(filename);
}

void Syscmds::executeFile(QString filename) {
    process.start(filename);
}
