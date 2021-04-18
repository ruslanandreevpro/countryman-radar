import 'package:countryman_radar/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeUI extends StatelessWidget {
  final AuthController _authController = AuthController.to;
  final MapController _mapController = MapController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Главный экран"),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: _authController.signOut,),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _mapController.initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController.googleMapController.complete(controller);
              _mapController.getCurrentPosition();
            },
          ),
        ],
      ),
    );
  }
}
