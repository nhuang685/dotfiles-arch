import qs.components
import qs.config
import qs.services
import QtQuick
import QtQuick.Layouts

StyledRect {
    text: Qt.formatDateTime(Clock.date, "ddd MMM d hh:mm:ss AP")
    color: Colors.emph
    extra: 15
}

