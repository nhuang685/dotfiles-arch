pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Services.SystemTray
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config
import qs.components

StyledRect {
    id: root
    property var panelWindow
    implicitWidth: rl.implicitWidth + 5 
    color: Colors.emph
    RowLayout {
        anchors.centerIn: parent
        id: rl
        spacing: 5

        Repeater {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: SystemTray.items
            delegate: MouseArea {
                id: entry
                required property var modelData
                implicitWidth: 20
                implicitHeight: 20
                Layout.alignment: Qt.AlignVCenter
                acceptedButtons: Qt.LeftButton
                               | Qt.RightButton
                               | Qt.MiddleButton
                cursorShape: Qt.PointingHandCursor
                onClicked: mouse => {
                    let item = modelData
                    if (item.onlyMenu)
                        openMenu()
                    if (mouse.button === Qt.LeftButton) {
                        if (item.onlyMenu)
                            openMenu();
                        else
                            item.activate();
                    } else if (mouse.button === Qt.RightButton) {
                        openMenu();
                    } else if (mouse.button === Qt.MiddleButton) {
                        item.secondaryActivate();
                    }
                }

                function openMenu() {
                    if (!modelData.hasMenu || !root.panelWindow)
                        return;

                    const pos = entry.mapToItem(
                        null, 0, entry.height
                    );

                    modelData.display(
                        root.panelWindow,
                        pos.x,
                        pos.y
                    );
                }

                IconImage {
                    anchors.fill: parent
                    source: parent.modelData.icon
                }
            }
        }
    }
    Component.onCompleted: {
        console.log(panelWindow)
    }
}
