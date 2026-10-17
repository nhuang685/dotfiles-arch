pragma ComponentBehavior: Bound
import Quickshell.Services.Pipewire
import Quickshell
import QtQuick
import qs.components
import qs.config

StyledRect {
    id: root
    property var sink: Pipewire.defaultAudioSink
    PwObjectTracker {
        objects: [root.sink]
    }
    property bool muted: sink?.audio?.muted ?? true
    property real volume: sink?.audio?.volume ?? 0 
    color: Colors.emph
    text: muted ? "M" : `${Math.round((volume ?? 0) * 100)}%`
    extra: 15

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
                       | Qt.RightButton
                       | Qt.MiddleButton
        cursorShape: Qt.PointingHandCursor
        onClicked: Quickshell.execDetached(["pavucontrol"])
    }
}
