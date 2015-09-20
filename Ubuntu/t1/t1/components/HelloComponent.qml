import QtQuick 2.0
import Ubuntu.Components 0.1

UbuntuShape {
    width: 100
    height: width

    property alias text : myText.text

    Label {
        id: myText
        anchors.centerIn: parent
    }
}
