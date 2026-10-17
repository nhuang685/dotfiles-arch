pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Hyprland
import qs.components
import qs.config

StyledRect {
    extra: 30
    color: Colors.bg2
    
    Connections {
        target: Hyprland

        function onActiveToplevelChanged() {
            Hyprland.refreshToplevels()
        }
    }

    text: {
        let top = Hyprland.activeToplevel
        if (!top.lastIpcObject.class)
            Hyprland.refreshToplevels()
        let maxLength = 75
        let title = top.title
        if (title.length > maxLength) {
            title = title.slice(0, maxLength - 3) + '...'
        }
        let isFullscreen = top.wayland.maximized || top.wayland.fullscreen
        return (isFullscreen ? "*F | " : "") + Hyprland.activeToplevel.lastIpcObject.class + " [ " + title + " ]"
    }
}
