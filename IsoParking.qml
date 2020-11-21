import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4

//import "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashqmls"
//import "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/imports/QtQuick/Studio/Components"

//import "./dashqmls"
//import "./imports/QtQuick/Studio/Components"

IsoItem{
    id: isoParking
    width: 60
    height: 60
    color: "#babdb6"
    source: "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashicons/iso_grs_7000_4_0238.dat"
    property bool active: true
    states: [
        State {
            name: "Active"
            when: isoParking.active

            PropertyChanges {
                target: isoParking
                color: "#ff1515"
            }
        }
    ]
    
}

/*##^##
Designer {
    D{i:0;height:60;width:60}
}
##^##*/
