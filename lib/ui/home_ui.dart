import 'package:countryman_radar/constants/constants.dart';
import 'package:countryman_radar/controllers/controllers.dart';
import 'package:countryman_radar/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeUI extends StatelessWidget {
  final AuthController _authController = AuthController.to;
  final MapController _mapController = MapController.to;
  final GlobalController _globalController = GlobalController.to;

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        drawer: Container(
          width: 270.0,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    children: [
                      Avatar(
                          photoUrl:
                              _authController.firestoreUser.value!.photoUrl,
                          size: 36.0),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        _authController.firestoreUser.value!.name == ''
                            ? 'Пользователь'
                            : _authController.firestoreUser.value!.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '${_authController.firestoreUser.value!.email}',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppThemes.lightTheme.primaryColor,
                  ),
                ),
                ListTile(
                  title: Text('Выход'),
                  onTap: () {
                    _authController.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    _globalController.latitude, _globalController.longitude),
                zoom: 18.0,
              ),
              // initialCameraPosition: _mapController.initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _mapController.googleMapController.complete(controller);
                _mapController.getCurrentPosition();
              },
            ),
            Positioned(
              left: 12.0,
              top: 12.0,
              child: Container(
                width: 40.0,
                height: 40.0,
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black54,
                      size: 24.0,
                    ),
                    onPressed: () {
                      _globalKey.currentState!.openDrawer();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
