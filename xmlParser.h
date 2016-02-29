#ifndef XMLPARSER_H
#define XMLPARSER_H

#include <QQuickItem>
#include <QDomDocument>

class XMLDataObject {
public:
    QString windowBorder;
    QString windowPosition;
    QString projectorCount;
    QString projectorResolution;
};

class XMLParser : public QQuickItem
{

    Q_OBJECT
public:
    XMLParser(QQuickItem *parent = 0);
    Q_INVOKABLE QVariant load();
    Q_INVOKABLE void save(QString filename, QVariant data);
    QList<XMLDataObject> list;

private:
    QString readNextText();
    QString errorString();

    QString _filename;
    QDomDocument xml;
};

#endif // XMLPARSER_H
