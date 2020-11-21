import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.0


Image {
    id: iso_195_156
    source: "file:///home/szymon/Documents/Workspace_Qt/psd_main_computer_ui/dashpngs/iso_195_156.png"
    fillMode: Image.PreserveAspectFit

    RowLayout {
        x: 0
        y: -6
        height: 85

        IsoParking {
            id: iconParking
            y: 8
            width: 65
            height: 65
            color: "#555753"
            active: false
        }

        IsoParking {
            id: iconAirConditioning
            y: 8
            width: 65
            height: 65
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_0027.dat"
            active: false
        }

        IsoParking {
            id: iconLongLights
            y: 8
            width: 65
            height: 65
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_0240.dat"
            active: false
        }

        IsoParking {
            id: iconFuel
            y: 9
            width: 60
            height: 60
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_0245.dat"
            active: false
        }

        IsoIconLights {
            id: iconLights
            y: 8
            active: false
        }

        IsoParking {
            id: iconEngine
            y: 8
            width: 65
            height: 65
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_0640.dat"
            active: false
        }

        IsoParking {
            id: iconAbs
            y: 8
            width: 65
            height: 65
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_1407.dat"
            active: false
        }

        IsoParking {
            id: iconBelts
            y: 8
            width: 65
            height: 65
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_1702.dat"
            active: false
        }

        IsoParking {
            id: iconCirculation
            y: 8
            width: 65
            height: 65
            color: "#555753"
            source: "dashicons/iso_grs_7000_4_2612.dat"
            active: false
        }
    }

    IsoParking {
        id: iconOpenDoors
        x: 814
        y: 2
        width: 65
        height: 65
        color: "#555753"
        source: "dashicons/iso_grs_7000_4_0638.dat"
        active: false
    }
    
    
    
    
    
    
    
    
}

/*##^##
Designer {
    D{i:0;height:67;width:899}
}
##^##*/
