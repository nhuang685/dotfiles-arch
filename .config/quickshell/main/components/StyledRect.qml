import QtQuick
import qs.config

Rectangle {
    property real extra: 0
    property string text
    implicitWidth: st.implicitWidth + extra
    implicitHeight: st.implicitHeight
    radius: Config.radius

    StyledText {
        id: st
        anchors.centerIn: parent
        text: parent.text
        color: Colors.textColor(parent.color)
    }
}
