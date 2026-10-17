pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.components
import qs.config

StyledRect {
    id: root
    color: Colors.bg
    implicitWidth: rl.implicitWidth
    property var panelWindow
    RowLayout {
        id: rl
        spacing: 5
        anchors.fill: parent

        AppTray {
            Layout.fillHeight: true
            panelWindow: root.panelWindow
        }

        // Network {
        //     Layout.fillHeight: true
        // }

        Volume {
            Layout.fillHeight: true
        }

        Time {
            Layout.fillHeight: true
        }
    }
}
