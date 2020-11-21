import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4

//import "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashqmls"
//import "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/imports/QtQuick/Studio/Components"

import QtQuick.Layouts 1.0

IsoItem {
    id: iconLights
    color: "#555753"
    source: "dashicons/iso_grs_7000_4_0456.dat"
    property bool active: true
    states: [
        State {
            name: "Active"
            when: iconLights.active

            PropertyChanges {
                target: iconLights
                color: "#eee450"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;height:85;width:85}
}
##^##*/
