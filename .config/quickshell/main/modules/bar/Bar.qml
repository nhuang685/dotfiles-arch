import QtQuick
import Quickshell
import QtQuick.Layouts
import qs.config
import qs.components
import "components"

Variants {
    model: Quickshell.screens
    PanelWindow {
        id: root
        required property var modelData
        screen: modelData
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 30
        implicitWidth: screen.width

        color: Colors.bg
        // color: "transparent"

        Item {
            anchors {
                fill: parent
                leftMargin: 15
                rightMargin: 15
                topMargin: 2.5
                bottomMargin: 2.5
            }
            Workspaces {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                height: parent.height
            }
            Title {
                anchors.centerIn: parent
                height: parent.height
            }
            BarRight {
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                height: parent.height
                panelWindow: root
            }
        }
    }
}
