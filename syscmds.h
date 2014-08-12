#ifndef SYSCMDS_H
#define SYSCMDS_H

#include <QQuickItem>
#include <QProcess>

class Syscmds : public QQuickItem
{
    Q_OBJECT
public:
    Syscmds(QQuickItem *parent = 0);
    Q_INVOKABLE void deleteFile(QString filename);
    Q_INVOKABLE void executeFile(QString filename);

private:
    void processError(QProcess::ProcessError err);

    QProcess process;
};

#endif // SYSCMDS_H
