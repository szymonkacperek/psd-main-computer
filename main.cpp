#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

/* Private includes */
#include <QQmlContext>
//#include <canopen_object_dict.h>
#include <serialport.h>

int main(int argc, char *argv[]) {
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;

  /* Connect C++ with QML engine */
  SerialPort serialPort;
  engine.rootContext()->setContextProperty("serialPort", &serialPort);

  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  /* Start reading from COM port */
  serialPort.connectToSerialPort();

  return app.exec();
}
