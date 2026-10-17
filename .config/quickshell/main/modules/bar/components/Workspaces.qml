pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts
import qs.config
import qs.components

StyledRect {
    width: rl.implicitWidth
    color: Colors.bg2
    RowLayout {
        anchors {
            fill: parent
            centerIn: parent
        }
        id: rl
        spacing: 5

        Repeater {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: Hyprland.workspaces
            delegate: Workspace {
                required property var modelData
                Layout.preferredWidth: 25 // idk why this "works"
                Layout.fillHeight: true
                workspace: modelData
                // Component.onCompleted: {
                //     console.log(width)
                //     console.log(height)
                // }
            }
        }
    }
}
