import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer..t1"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    width: units.gu(30)
    height: units.gu(40)

    Page {
        title: i18n.tr("Simple")

        Column {
            spacing: units.gu(1)
            anchors {
                margins: units.gu(2)
                fill: parent
            }

            HelloComponent {
                id: label
                objectName: "label"

                text: i18n.tr("Hello..")
            }

            Button {
                objectName: "button"
                width: parent.width

                text: i18n.tr("Tap me!")

                onClicked: {
                    var message0 = "Hello..";
                    var message1 = "..world!";
                    switch (label.text) {
                    case message0:
                        label.text = i18n.tr(message1);
                        break;
                    default:
                        label.text = i18n.tr(message0);
                        break;
                    }
                }
            }
        }
    }
}
