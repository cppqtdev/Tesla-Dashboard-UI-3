// ******************************************
// ** Map and Route Simulation Page        **
// ******************************************
//
// This QML page simulates a map and route functionality using Mapbox and OpenStreetMap. It
// demonstrates the journey from a current location to a destination by animating a car marker
// along the calculated route. The animation includes tilting and rotating the map.
//
// Key Features:
// - Visualization of a map with a route line.
// - Animated car marker to simulate route traversal.
// - Map tilting and rotating animations.
// - GeoModel to find destination coordinates.
// - RouteModel to calculate the route.
//
// This page is intended for demonstration purposes and can be customized to fit your
// application's needs for displaying routes and geolocation data.
//
// ******************************************

import QtQuick 2.9
import QtLocation 5.6
import QtQml 2.3
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import QtPositioning 5.6
import Style 1.0

Page {
    id: pageMap

    property var currentLoc: QtPositioning.coordinate(28.4595, 77.0266)   // current location
    property bool isRoutingStart: false
    property bool runMapAnimation: false
    property bool enableGradient: true
    padding: 0

    function startAnimation (){
        geoModel.update()
    }

    // Gradient to give fading effect on edges
    RadialGradient {
        z: 1
        visible: enableGradient
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#00000000"
            }
            GradientStop {
                position: 0.72
                color: "#000000"
            }
        }
    }

    // Main map
    Map {
        id: map

        anchors.fill: parent
        copyrightsVisible: false
        center: QtPositioning.coordinate(28.4595, 77.0266)
        zoomLevel: 13.3
        bearing: -80

        plugin: Plugin {
            name: "mapboxgl"

            PluginParameter { name: "mapboxgl.access_token"; value: "pk.eyJ1IjoiaGFzZWVidGFyaXExOTk4IiwiYSI6ImNsbGw4cXQ3YTFsdXkzanBxaG1rZDZrYTgifQ.8M9sbj-GM8oDrhAfCMUasw"}
            PluginParameter { name: "mapboxgl.mapping.additional_style_urls"; value: "mapbox://styles/haseebtariq1998/clm1o9olf00rf01qxb3nr9n82"}
        }


        // Route line, to show route from current location to destination
        MapItemView{
            id: mapRouteLine

            model: routeModel
            delegate: Component {
                MapRoute{
                    route: routeData
                    line.color: "aqua"
                    line.width: adaptive.width(7)
                }
            }
        }

        // Current location marker
        MapQuickItem{
            id: currentLocationMarker

            coordinate: QtPositioning.coordinate(28.4595, 77.0266)
            visible: false
            z: 1

            onCoordinateChanged:
            {
                if(isRoutingStart)
                    map.center = coordinate
            }

            sourceItem: Rectangle{
                width: adaptive.width(100) * (map.zoomLevel / 17)
                height: adaptive.height(100) *  (map.zoomLevel / 17)
                color: "transparent"
                anchors.centerIn: parent
                radius: 180

                Image {
                    id: car
                    width: adaptive.width(100) * (map.zoomLevel / 17)
                    height: adaptive.height(100) *  (map.zoomLevel / 17)
                    source: "qrc:/Map/CarMarker.png"
                    anchors.centerIn: parent
                }
            }

            Behavior on coordinate {
                PropertyAnimation {
                    duration: 5000
                }
            }
        }


        // Destination marker
        MapQuickItem{
            id: destinationMarker

            visible: false
            z: 1

            sourceItem: Rectangle{
                width: adaptive.width(50) * (map.zoomLevel / 17)
                height: adaptive.height(50) *  (map.zoomLevel / 17)
                color: "transparent"
                anchors.centerIn: parent
                radius: 180

                AnimatedImage {
                    width: adaptive.width(50) * (map.zoomLevel / 17)
                    height: adaptive.height(50) *  (map.zoomLevel / 17)
                    source: "qrc:/animIcons/icons8-destination.gif"
                    anchors.centerIn: parent
                }
            }
        }

        // Departure location marker
        MapQuickItem{
            id: startMarker

            visible: false
            z: 1
            sourceItem: Rectangle{
                width: adaptive.width(50) * (map.zoomLevel / 17)
                height: adaptive.height(50) *  (map.zoomLevel / 17)
                color: "transparent"
                anchors.centerIn: parent
                radius: 180

                Image {
                    width: adaptive.width(50) * (map.zoomLevel / 17)
                    height: adaptive.height(50) *  (map.zoomLevel / 17)
                    source: "qrc:/Map/LocationMarker.png"
                    anchors.centerIn: parent
                }
            }
        }



        // Route model to calculate route
        RouteModel{
            id : routeModel

            plugin: geoModel.plugin
            query: RouteQuery{
                id:  routeQuery
            }

            onRoutesChanged: {
                map.center = routeModel.get(0).path[ (routeModel.get(0).path.length/2).toFixed(0) ]
                destinationMarker.coordinate = QtPositioning.coordinate(26.2124,78.1772) //routeModel.get(0).path[ routeModel.get(0).path.length -1 ]
                startMarker.coordinate = currentLoc
                destinationMarker.visible = true
                startMarker.visible = true
                animationTimer.running = true
            }
        }


        // Timer to start car driving animation
        Timer{
            id: animationTimer

            interval: 3000
            onTriggered: {
                startMarker.visible = false
                currentLocationMarker.visible = true
                isRoutingStart = true
                simulateDrive.path = routeModel.get(0).path

                routeStartAnimation.running = true
                simulateDrive.running = true
            }
        }

        // To simulate car driving on route
        Timer{
            id: simulateDrive

            property var path
            property int index

            interval: 1000
            repeat: true
            onTriggered: {
                if(path.length > index)
                {
                    currentLocationMarker.coordinate = path[index]
                    index++
                }
                else{
                    simulateDrive.stop()
                }

            }
        }

        // To find coordinate of destination location
        GeocodeModel{
            id: geoModel

            plugin: Plugin
            {
                name: "osm"
                PluginParameter {
                    name: "osm.mapping.custom.host"
                    value: "https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png"
                }
            }
            query: "Gwalior"

            onLocationsChanged: {
                if(count)
                {
                    routeQuery.addWaypoint(currentLoc)
                    routeQuery.addWaypoint(get(0).coordinate)
                    routeModel.update()
                }
            }
        }
    }


    // Animation to show at start where map tilts and rotates
    SequentialAnimation{
        id: routeStartAnimation

        PropertyAnimation {
            id: centeranimation

            duration: 1000
            target: map
            property: "center"
            to: currentLoc
        }
        NumberAnimation{
            id: zoomAnimation

            target: map
            duration: 6000
            properties: "zoomLevel"
            from: map.zoomLevel
            to: 18
        }

        NumberAnimation{
            id: tiltAnimation

            target: map
            duration: 1000
            properties: "tilt"
            from: 0
            to: map.maximumTilt
        }

        NumberAnimation{
            id: rotationAnimation

            target: map
            duration: 5000
            properties: "bearing"
            from: -80
            to: 0
        }
    }
}
