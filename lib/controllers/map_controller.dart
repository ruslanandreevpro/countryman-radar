import 'dart:async';

import 'package:countryman_radar/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  static MapController to = Get.find();

  final GlobalController _globalController = GlobalController.to;

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  void onReady() {
    getCurrentPosition();
  }

  final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(56.8637312, 53.088019),
    zoom: 14,
  );

  void getCurrentPosition() async {
    final GoogleMapController newMapController = await googleMapController.future;

    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    LatLng latLngPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
    _globalController.latitude = currentPosition.latitude;
    _globalController.longitude = currentPosition.longitude;
    CameraPosition cameraPosition = CameraPosition(target: latLngPosition, zoom: 18.0);
    newMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}