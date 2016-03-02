#include "xmlParser.h"

XMLParser::XMLParser(QQuickItem *parent) : QQuickItem(parent){
    filename = "/Users/Charles/Code/openFrameworks/apps/myApps/vDome/bin/data/settings.xml";
    defaultFilename = "/Users/Charles/Code/openFrameworks/apps/myApps/vDome/bin/data/default/settings.xml";
}

QVariant XMLParser::load(){

    // load file
    QStringList list;
    QDomDocument doc;
    QFile file(filename);

    if (!file.open(QIODevice::ReadOnly) || !doc.setContent(&file))
        return QVariant::fromValue(list);


    // parse xml
     QDomElement element;
     QString attr;
     int pCount = 0;


     // window xml
     QDomNodeList window = doc.elementsByTagName("window");

     for (int i = 0; i < window.size(); i++) {

         // reset projector count
         pCount = 0;

         // window index
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
         for (QDomElement p = projectors.firstChildElement("projector"); !p.isNull(); p = p.nextSiblingElement("projector")){
             pCount++;

             attr = p.attribute("resolution");
         }

         // projector count
         list << "pCount" << QString::number(pCount);

         // resolution
         list << "resolution" << attr;
    }



///////////////
     qDebug() <<  list;

    return QVariant::fromValue(list);
}

void XMLParser::save(QVariant data){


    // load default file
    QStringList list;
    QDomDocument doc;
    QFile file(defaultFilename);

    if (!file.open(QIODevice::ReadOnly) || !doc.setContent(&file))
        return;



    QDomNode element;
    QString attr;

    QDomNode pClone;
    QDomNode wClone;



    QDomNodeList p = doc.elementsByTagName("projector");
    pClone = p.at(0).cloneNode();

    QDomNodeList w = doc.elementsByTagName("window");
    wClone = w.at(0).cloneNode(false);



    QDomNode v = doc.firstChild();

    v.removeChild(w.at(0));

    QStringList dataList = data.toStringList();

    for (int i=0; i<dataList.count(); i++) {
        if (dataList[i] == "window"){
            QDomElement clone = wClone.cloneNode(false).toElement();

            clone.setAttribute("border", dataList[i+3]);
            clone.setAttribute("position", dataList[i+5]);

            int pCount = dataList[i+7].toInt();

            qDebug() << dataList[i+9];

            int resx = dataList[i+9].toInt();
            int resy = dataList[i+10].toInt();
            clone.setAttribute("resolution", ( QString::number(resx*pCount) + "," + QString::number(resy) ) );

            for (int j=0; j<pCount; j++){
                QDomElement clone2 = pClone.cloneNode().toElement();
                QString res = ( dataList[i+9] + "," + dataList[i+10] );
                clone2.setAttribute("resolution", res);
                clone.appendChild(clone2);
            }

            v.appendChild(clone);
        }

    }


    QFile fileOut( filename );
    if( !fileOut.open( QIODevice::WriteOnly | QIODevice::Text ) )
    {
       qDebug( "Failed to open file for writing." );
    }
    QTextStream stream( &fileOut );
    stream << doc.toString();
    fileOut.close();


}



