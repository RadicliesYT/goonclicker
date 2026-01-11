#include <QGuiApplication>
#include <QQmlApplicationEngine>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;

    // Use the QRC path to ensure the APK finds the files inside its package
    const QUrl url(u"qrc:/untitled/main.qml"_qs);

    engine.load(url);
    return app.exec();
}
