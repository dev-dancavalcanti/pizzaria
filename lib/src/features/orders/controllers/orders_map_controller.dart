import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersMapController extends ChangeNotifier {
  late GoogleMapController _mapController;
  String erro = '';
  double lat = 0.0;
  double long = 0.0;

  OrdersMapController() {
    myPosition();
  }

  myPosition() async {
    try {
      Position position = await _position();
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      erro = e.toString();
      print(e);
    }
    notifyListeners();
  }

  Future<Position> _position() async {
    LocationPermission locationPermission;

    bool permission = await Geolocator.isLocationServiceEnabled();

    if (!permission) {
      return Future.error("Por favor, ative a localizacao");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error("Por favor, ative a localizacao");
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Por favor, ative a localizacao");
    }

    return await Geolocator.getCurrentPosition();
  }

  onMapController(GoogleMapController gmc) async {
    _mapController = gmc;
  }
}
