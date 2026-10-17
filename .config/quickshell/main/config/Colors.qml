pragma Singleton 
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    readonly property color bg: Qt.color("#eef1f2")
    readonly property color bg2: Qt.color("#e0e5e7")
    readonly property color emph: Qt.color("#2F6277")
    function textColor(backgroundColor) {
        let c = Qt.color(backgroundColor)
        if ((c.r * 0.299 + c.g * 0.587 + c.b * 0.114) > 186 / 255)
            return "#000000" 
        else 
            return "#ffffff"
    }
}
