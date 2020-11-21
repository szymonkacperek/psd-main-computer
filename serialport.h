#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QDebug>
#include <QSerialPort>
#include <QSerialPortInfo>


class SerialPort : public QObject
{
    Q_OBJECT

public:
//    Q_PROPERTY(QString serialport_message READ readFromSerialPort NOTIFY newSerialPortData)
    Q_PROPERTY(QString velocity READ readFromSerialPort NOTIFY newSerialPortData)

    explicit SerialPort(QObject *parent = nullptr);
    void connectToSerialPort();

public slots:
    QString readFromSerialPort();

signals:
    void newSerialPortData();

private:
    QString ecm_com_port;
    QSerialPort *serialport_device;
    QString serialport_message;
    QString velocity;
    int position;
};

#endif // SERIALPORT_H
