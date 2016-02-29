#include "xmlParser.h"

XMLParser::XMLParser(QQuickItem *parent) : QQuickItem(parent)
{
}

QVariant XMLParser::load()
{

    QStringList list;


    QString filename = "/Users/Charles/Code/build-vDome-Desktop_Qt_5_5_1_clang_64bit-Debug/data/settings.xml";
     qDebug() << "load";
     QDomDocument doc;
         QFile file(filename);
         if (!file.open(QIODevice::ReadOnly) || !doc.setContent(&file))
             return QVariant::fromValue(list);
     qDebug() << "file loaded";



     QDomElement element;
     QString attr;
     int projectorIndex = 0;

     // window
     QDomNodeList window = doc.elementsByTagName("window");

     for (int i = 0; i < window.size(); i++) {
         list << "window" << QString::number(i);

         // border
         element = window.at(i).toElement();
         attr = element.attribute("border");
         list << "border" << attr;

         // position
         element = window.at(i).toElement();
         attr = element.attribute("position");
         list << "position" << attr;

         // projector
         QDomElement projectors = element;
         for(QDomElement p = projectors.firstChildElement("projector"); !p.isNull(); p = p.nextSiblingElement("projector"))
         {
             list << "projector" << QString::number(projectorIndex);

             // resolution
             attr = p.attribute("resolution");
             list << "resolution" << attr;
             projectorIndex++;

         }
    }



     qDebug() <<  list;


    return QVariant::fromValue(list);
}

void XMLParser::save(QString filename, QVariant data)
{


}



