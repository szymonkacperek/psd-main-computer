#include "serialport.h"

SerialPort::SerialPort(QObject *parent) : QObject(parent)
{
    /* Creating constructor and freeing memory */
    this->serialport_device = new QSerialPort(this);

}

/*
 * @brief: Establishing connection with serial port.
 *
 */
void SerialPort::connectToSerialPort()
{
    /* Private variables */
    qDebug()<<"Looking for ECM COM port...";
    QList<QSerialPortInfo> serialport_device_list;
    serialport_device_list = QSerialPortInfo::availablePorts();

    /* Looking for ECM COM Port*/
    for (int i=0; i<serialport_device_list.count(); i++){
        qDebug()<<"Found device name: " + serialport_device_list.at(i).portName() + " and description: " + serialport_device_list.at(i).description();
        if (serialport_device_list.at(i).description() == "PsdEcmComPort"){
            ecm_com_port = serialport_device_list.at(i).portName();
            qDebug()<<"Found ECM COM Port under description:" + serialport_device_list.at(i).portName() + " " + serialport_device_list.at(i).description();
            break;
        }else{
            qDebug()<<"Could not find ECM COM Port. Checking other ports...";
        }
    }

    /* Establishing connection */
    this->serialport_device->setPortName(ecm_com_port);
    if (serialport_device->open(QSerialPort::ReadWrite)){
        qDebug()<<"Port " + serialport_device->portName() + " opened.";
        this->serialport_device->setBaudRate(QSerialPort::Baud115200);
        this->serialport_device->setDataBits(QSerialPort::Data8);
        this->serialport_device->setParity(QSerialPort::NoParity);
        this->serialport_device->setStopBits(QSerialPort::OneStop);
        this->serialport_device->setFlowControl(QSerialPort::NoFlowControl);
        connect(this->serialport_device, SIGNAL(readyRead()), this, SLOT(readFromSerialPort()));
        qDebug()<<"Connection with " + serialport_device->portName() + " established.";

    } else {
        qDebug()<<"Port could not be opened.";

    }


}
/*
 * @brief: Read data from serial port
 * @return: Value stored in inbox
 *
 */
QString SerialPort::readFromSerialPort(){
    /* Emit signal and read new data */
    emit newSerialPortData();
    serialport_message = this->serialport_device->readLine();
    QString terminator = "\r";
    qDebug()<<"Serial port message: " + serialport_message;

    /* Filter incoming CAN frames */
    uint8_t can_id = serialport_message.mid(6, 2).toUInt();
    if (can_id == 10){
        QString qstr_velocity = serialport_message.mid(30, 2);
        bool ok;
        int hex_velocity = qstr_velocity.toInt(&ok, 16);
        velocity = QString::number(hex_velocity);
        return velocity;

    } else {
        qDebug()<<"No matching CAN ID found.";
        return serialport_message;

        }

}
