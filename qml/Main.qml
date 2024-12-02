import Felgo
import QtQuick

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"
    Window {
     width: 640
     height: 480
     visible: true
     title: qsTr("Hello World")

     minimumWidth: 400
     minimumHeight: 450

     Rectangle{
         id:rect
         width:300; height:400
         anchors.centerIn:parent
         color:"lightgrey"
         states:[
             State {
                 name: "stop"
                 PropertyChanges {target: rect_red; color:"red"}
                 PropertyChanges {target:rect_yellow; color:"black"}
                 PropertyChanges {target:rect_green;color:"black"}
             },
             State {
                 name: "caution"
                 PropertyChanges {target: rect_red; color:"black"}
                 PropertyChanges {target:rect_yellow; color:"yellow"}
                 PropertyChanges {target:rect_green; color:"black"}
             },
             State {
                 name: "go"
                 PropertyChanges {target: rect_red;color:"black"}
                 PropertyChanges {target:rect_yellow;color:"black"}
                 PropertyChanges {target:rect_green;color:"green"}
             } ]
         state:"stop"
         MouseArea{
         anchors.fill:parent
         onClicked: {
             if (parent.state === "stop") {
                parent.state = "caution";
             } else if (parent.state === "caution") {
                parent.state = "go";
             } else {
                parent.state = "stop";
             }
        }


         transitions: Transition {
             ColorAnimation {
              property: "color"
              easing.type: Easing.InOutQuad
              duration: 1000
              }
        }
         Rectangle{
             id:rect_red
             width:100; height:100
             border.color:"black"; border.width:1;
             color:"red"
             anchors.horizontalCenter:parent.horizontalCenter
             y:25
         }
         Rectangle{
             id:rect_yellow
             width:100; height:100
             border.color:"black"; border.width:1;
             color:"yellow"
             anchors.horizontalCenter:parent.horizontalCenter; y:150
         }
         Rectangle{
             id:rect_green
             width:100; height:100
             border.color:"black"; border.width:1;
             color:"green"
             anchors.horizontalCenter:parent.horizontalCenter; y:275
         }
     }
    }

}
