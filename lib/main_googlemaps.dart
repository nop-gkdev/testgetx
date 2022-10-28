// ignore_for_file: prefer_const_constructors, unused_field, duplicate_ignore

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  // ignore: prefer_const_constructors
  static final Marker _markers = Marker(
      markerId: const MarkerId('_marker'),
      infoWindow: const InfoWindow(title: 'Gunkul'),
      icon: BitmapDescriptor.defaultMarker,
      position: const LatLng(13.77817720163639, 100.54375709086075));

  // ignore: prefer_const_constructors
  static final Marker _markers2 = Marker(
      markerId: const MarkerId('_marker'),
      infoWindow: const InfoWindow(title: 'Kasatsart U.'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      position: const LatLng(13.848315628832777, 100.56945852937261));

  // static final Polyline _polyline =
  //     // ignore: prefer_const_literals_to_create_immutables
  //     Polyline(
  //   polylineId: PolylineId('_polyline'),

  //   // ignore: prefer_const_literals_to_create_immutables
  //   points: [
  //     LatLng(13.848315628832777, 100.56945852937261),
  //     LatLng(13.77817720163639, 100.54375709086075),
  //   ],
  //   width: 4,
  //   color: Color.fromARGB(255, 2, 30, 53),
  // );

  Position? userLocation;
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    getPolyPoints();
  }

  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    userLocation = await Geolocator.getCurrentPosition();
    if (userLocation!.latitude == null && userLocation!.longitude == null) {
      final a = Position(
        longitude: 100.56945852937261,
        latitude: 13.848315628832777,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
      );
      return a;
    } else {
      return userLocation!;
    }
  }

  String googleAPiKey = "AIzaSyA3TysImeEA1qhxFQQQa3SWMjDWKlady24";
  List<LatLng> polylineCoordinates = [];
  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      // PointLatLng(13.848322667623602, 100.5693749670141),
      PointLatLng(userLocation!.latitude, userLocation!.longitude),
      PointLatLng(13.77817720163639, 100.54375709086075),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _getLocation();
    // getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Maps'),
        backgroundColor: Color.fromARGB(255, 7, 57, 98),
      ),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              // polylines: {_polyline},
              polylines: {
                Polyline(
                  polylineId: PolylineId("_polyline"),
                  points: polylineCoordinates,
                  width: 7,
                  color: Color.fromARGB(255, 10, 74, 126),
                ),
              },
              markers: {_markers, _markers2},
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(userLocation!.latitude, userLocation!.longitude),
                zoom: 12.5,
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
