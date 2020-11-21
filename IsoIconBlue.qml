import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.0

//import "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashqmls"
//import "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/imports/QtQuick/Studio/Components"

//import "./dashqmls"
//import "./imports/QtQuick/Studio/Components"




IsoParking {
    id: iconLights
    width: 65
    height: 65
    color: "#939d89"
    source: "dashicons/iso_grs_7000_4_0456.dat"
    property alias iconLightsActive: iconLights.active
    active: false
    states: [
        State {
            name: "On"
            when: IsoIconBlue.active

            PropertyChanges {
                target: iconLights
                color: "#93a530"
                active: false
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:6;height:85;width:85}
}
##^##*/
