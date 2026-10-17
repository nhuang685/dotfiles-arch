pragma ComponentBehavior: Bound
import Quickshell.Hyprland
import QtQuick
import qs.config
import qs.components

// Rectangle {
StyledRect {
    id: root
    required property HyprlandWorkspace workspace
    readonly property int index: workspace.id
    readonly property bool isSpecial: index < 1 || index > 10
    property bool isActive: workspace.focused
    // color: isActive ? Colors.emph : (workspace.urgent ? "#ad0000" : Colors.bg2)
    color: workspace.urgent ? "#ad0000" : (isActive ? Colors.emph : Colors.bg2)
    text: isSpecial ? 'S' : index

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
                       | Qt.RightButton
                       | Qt.MiddleButton
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Hyprland.dispatch(`hl.dsp.focus({ workspace = "${parent.index}"})`)
        }
    }

    Connections {
        // vibe-coded
        target: Hyprland

        function onRawEvent(event) {
            if (!root.isSpecial || event.name !== "activespecial")
                return;

            const args = event.parse(2);
            const workspace = args[0];
            const monitor = args[1];

            if (monitor === Hyprland.focusedMonitor?.name)
                root.isActive = workspace === "special:magic";
        }
    }
}
