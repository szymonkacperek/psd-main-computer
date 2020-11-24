import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4




ApplicationWindow {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Dashboard gauges, PUT Solar Dynamics")

    function leftIndicatorState(){
            leftIndicator.on = true
//        var turn_indicator_left = false

        if (serialPort.lights === 1){
//            turn_indicator_left = true
            leftIndicator.on = true
//            return 1

        } else {
//            turn_indicator_left = false
            leftIndicator.on = false
//            return 0
        }

    }

    Image {
        id: background
        anchors.fill: parent
        source: "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashpngs/backgrounds_195_610.png"
        mipmap: true
        fillMode: Image.Stretch

        Image {
            id: psd_logo_white
            x: 1696
            y: 30
            opacity: 0.5
            source: "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashpngs/psd_logo_white.png"
            fillMode: Image.PreserveAspectFit
        }

        CircularGauge {
            id: circGaugeSpeedometer
            x: 702
            y: 194
            width: 516
            height: 516
            value: qsTr(serialPort.velocity)
            enabled: false
            stepSize: 0
            maximumValue: 200
            style: DashboardGaugeStyle {}
        }

        CircularGauge {
            id: circGaugePower
            x: 1514
            y: 370
            width: 335
            height: 728
            value: 7
            stepSize: 1
            maximumValue: 12
            style: IconGaugeStyle {
                id: tempGaugeStyle

                //                icon: "qrc:/images/temperature-icon.png"
                maxWarningColor: Qt.rgba(0.5, 0, 0, 1)

                tickmarkLabel: Text {
                    color: "white"
                    visible: styleData.value === 0 || styleData.value === 12
                    font.pixelSize: tempGaugeStyle.toPixels(0.225)
                    text: styleData.value === 0 ? "0" : (styleData.value === 12 ? "12" : "12")
                    //                    text: "POWER"
                }
            }

            Text {
                id: text1
                x: 126
                y: 388
                width: 149
                height: 32
                color: "#f7f6f6"
                text: qsTr("POWER")
                font.pixelSize: 30
            }

            Text {
                id: txtPower
                x: 126
                y: 426
                width: 39
                height: 32
                color: "#f7f6f6"
                text: circGaugePower.value
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
            }

            Text {
                id: text3
                x: 171
                y: 426
                width: 149
                height: 32
                color: "#f7f6f6"
                text: qsTr("kW")
                font.pixelSize: 30
            }


        }

        CircularGauge {
            id: circGaugeBattery
            x: 72
            y: 556
            width: 408
            height: 312
            value: 75
            maximumValue: 100
            stepSize: 1
            style: IconGaugeStyle {
                id: tempGaugeStyle1

                //                icon: "qrc:/images/temperature-icon.png"
                maxWarningColor: Qt.rgba(0.5, 0, 0, 1)

                tickmarkLabel: Text {
                    color: "white"
                    visible: styleData.value === 0 || styleData.value === 100
                    font.pixelSize: tempGaugeStyle1.toPixels(0.225)
                    text: styleData.value === 0 ? "0" : (styleData.value === 100 ? "100" : "100")
                    //                    text: "POWER"
                }

            }

            Text {
                id: text5
                x: 130
                y: 175
                width: 149
                height: 32
                color: "#f7f6f6"
                text: qsTr("BATTERY")
                font.pixelSize: 30
            }

            Text {
                id: text6
                x: 207
                y: 213
                width: 149
                height: 32
                color: "#f7f6f6"
                text: qsTr("%")
                font.pixelSize: 30
            }

            Text {
                id: txtBattery
                x: 152
                y: 213
                width: 49
                height: 32
                color: "#f7f6f6"
                text: circGaugeBattery.value
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
            }
        }

        IsoIconsBar {
            id: iso_195_156
            x: 511
            y: 796
        }

        TurnIndicator{
            function leftIndicatorState(){
//                if (serialPort.lights === 1)
//                    return true
//                else
//                    return false
                return false

            }

            id: leftIndicator
            x: 474
            y: 360
            width: 142
            height: 152
            direction: 3
            flashing: false
            on: leftIndicatorState()


        }

        TurnIndicator {
            id: rightIndicator
            x: 1308
            y: 360
            width: 142
            height: 152
            on: true
            flashing: false
            direction: 2
        }

    }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
