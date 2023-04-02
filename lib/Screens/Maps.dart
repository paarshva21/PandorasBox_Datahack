import 'package:datahack/Screens/UserPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController _mapController;
  var user = FirebaseAuth.instance.currentUser;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('Portland'),
      position: LatLng(45.523064, -122.676483),
      infoWindow: InfoWindow(title: 'Portland'),
    ),
    Marker(
      markerId: MarkerId('Seattle'),
      position: LatLng(47.606209, -122.332071),
      infoWindow: InfoWindow(title: 'Seattle'),
    ),
    Marker(
      markerId: MarkerId('Lincoln City'),
      position: LatLng(44.9621, -124.0159),
      infoWindow: InfoWindow(title: 'Seattle'),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 7.0),
          onMapCreated: _onMapCreated,
          markers: _markers,
        ),
      ),
      drawer: NavDrawer(),
    ));
  }
}
