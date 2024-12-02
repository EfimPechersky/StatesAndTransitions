import Felgo
import QtQuick
import QtQuick.Window 2.15
import QtQuick.Layouts 1.12
import QtQuick.Controls
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
     title: qsTr("Task1")

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
    Window{
           id:laywin
           title: "Task2"
           width: 300
           height: 700
           visible: true
           property int myMargin:5
           ColumnLayout{
               id:col1
               spacing:myMargin
               anchors.fill:parent

               states:[
                   State {
                       name: "home"
                       PropertyChanges {target: bt1; opacity:1}
                       PropertyChanges {target:btn2; opacity:1}
                       PropertyChanges {target:btn3; opacity:1}
                       PropertyChanges {target:headertext; text:"Header"}
                       PropertyChanges {target:contenttext; text:"Some content"}
                       PropertyChanges {target:back; opacity:0}
                   },
                   State {
                       name: "content1"
                       PropertyChanges {target:btn1; opacity:1}
                       PropertyChanges {target:btn2; opacity:0.5}
                       PropertyChanges {target:btn3; opacity:0.5}
                       PropertyChanges {target:headertext; text:"Header 1"}
                       PropertyChanges {target:contenttext; text:"Item 1 content"}
                       PropertyChanges {target:back; opacity:1}
                   },
                   State {
                       name: "content2"
                       PropertyChanges {target:btn1; opacity:0.5}
                       PropertyChanges {target:btn2; opacity:1}
                       PropertyChanges {target:btn3; opacity:0.5}
                       PropertyChanges {target:headertext; text:"Header 2"}
                       PropertyChanges {target:contenttext; text:"Item 2 content"}
                       PropertyChanges {target:back; opacity:1}
                   },
                   State {
                       name: "content3"
                       PropertyChanges {target:btn1; opacity:0.5}
                       PropertyChanges {target:btn2; opacity:0.5}
                       PropertyChanges {target:btn3; opacity:1}
                       PropertyChanges {target:headertext; text:"Header 3"}
                       PropertyChanges {target:contenttext; text:"Item 3 content"}
                       PropertyChanges {target:back; opacity:1}
                   }]
               state:"home"

               RowLayout{
                   id:header
                   Layout.fillWidth: true
                   Layout.preferredHeight:1
                   Layout.minimumHeight:100

                   Rectangle{
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       color:"gainsboro"
                       Rectangle{
                           id:back
                           anchors.left:parent.left
                           anchors.verticalCenter: parent.verticalCenter
                           width:70
                           height:30
                           color:"gray"
                           Text{
                               id:backtext
                               text:"Back"
                               anchors.horizontalCenter: parent.horizontalCenter
                               anchors.verticalCenter:parent.verticalCenter
                           }
                           MouseArea{
                               anchors.fill: parent
                               onClicked: {
                                   col1.state = "home";
                               }
                           }
                       }
                       Text{
                           id:headertext
                           text:"Header"
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.verticalCenter:parent.verticalCenter
                       }


                   }

               }
               GridLayout{
                   id:content
                   Layout.fillWidth: true
                   Layout.preferredHeight:6
                   Layout.minimumHeight:400
                   Rectangle{
                       Layout.fillWidth: true
                       Layout.fillHeight: true
                       border.color:"gainsboro"
                       border.width:5
                       Text{
                           id:contenttext
                           text:"Content"
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.verticalCenter:parent.verticalCenter
                       }
                   }
               }


               RowLayout{
                   id:footer
                   Layout.preferredHeight:1
                   Layout.fillWidth: true
                   spacing:myMargin
                   Layout.minimumHeight:100
                   Rectangle{
                       id:btn1
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       color:"darkgray"

                       Text{
                           text:"1"
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.verticalCenter:parent.verticalCenter
                       }
                       MouseArea{
                           anchors.fill: parent
                           onClicked: {
                               col1.state = "content1";
                           }
                       }
                   }
                   Rectangle{
                       id:btn2
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       color:"darkgray"
                       Text{
                           text:"2"
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.verticalCenter:parent.verticalCenter
                       }
                       MouseArea{
                           anchors.fill: parent
                           onClicked: {
                               col1.state = "content2";
                           }
                       }
                   }
                   Rectangle{
                       id:btn3
                       Layout.fillHeight: true
                       Layout.fillWidth: true
                       color:"darkgray"
                       Text{
                           text:"3"
                           anchors.horizontalCenter: parent.horizontalCenter
                           anchors.verticalCenter:parent.verticalCenter
                       }
                       MouseArea{
                           anchors.fill: parent
                           onClicked: {
                               col1.state = "content3";
                           }
                       }
                   }

                   }
               }

}
}
