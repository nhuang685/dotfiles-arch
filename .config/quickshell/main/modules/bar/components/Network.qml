pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Networking
import QtQuick
import qs.components
import qs.config

StyledRect {
    id: root
    color: Colors.emph
    Component.onCompleted: {
        // Networking.devices.values.forEach(device => {
        //     console.log("device: " + device.name)
        //     device.networks.values.forEach(network => {
        //         console.log("network: " + network.name)
        //     })
        // })

        Array.from(Networking.devices.values).flatMap(device => Array.from(device.networks.values)).forEach(network => {
            console.log(1)
            console.log("network: " + network.name)
        })
    }
}
