#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QDebug>
#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>

#include <canopen_object_dict.h>

class SerialPort : public QObject {
  Q_OBJECT

public:
  //    Q_PROPERTY(QString serialport_message READ readFromSerialPort NOTIFY
  //    newSerialPortData)
  Q_PROPERTY(QString velocity READ readFromSerialPort NOTIFY newSerialPortData)
  Q_PROPERTY(QString lights READ readFromSerialPort NOTIFY newSerialPortData)

  explicit SerialPort(QObject *parent = nullptr);
  void connectToSerialPort();

public slots:
  int readFromSerialPort();

signals:
  void newSerialPortData();

private:
  QString ecm_com_port;
  QSerialPort *serialport_device;
  QString serialport_message;
  double velocity;
  double lights;
  int position;
};

#endif // SERIALPORT_H
