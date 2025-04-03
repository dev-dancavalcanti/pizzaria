import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:pizzaria/env.dart';
import 'package:pizzaria/src/features/orders/services/http/http_service.dart';

class OrdersMapController extends ChangeNotifier {
  final HttpService _mapsRepositories;
  late GoogleMapController _mapController;
  late Position position;
  String erro = '';
  double lat = -15.5472;
  double long = -47.3445;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> listLatLng = [];
  bool isLoading = false;

  OrdersMapController(this._mapsRepositories) {
    myPosition();
  }

  toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  myPosition() async {
    try {
      toggleLoading();
      await _position().then((_) async {
        await polylinesPoints().then((_) {
          generatePolyline();
        });
      });
      var response = await _mapsRepositories.get("-15.5447%2C-47.3410");
      print(response);
      lat = position.latitude;
      long = position.longitude;
      var test1 = encodePoint(lat);
      var test2 = encodePoint(long);
    } catch (e) {
      erro = e.toString();
    }
    toggleLoading();
  }

  Future<void> _position() async {
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

    position = await Geolocator.getCurrentPosition();
  }

  onMapController(GoogleMapController gmc) async {
    _mapController = gmc;
    notifyListeners();
  }

  void generatePolyline() async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.blueGrey, points: listLatLng, width: 6);

    polylines[id] = polyline;
    print(polylines);
    notifyListeners();
  }

  Future<List<LatLng>> polylinesPoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
            origin: PointLatLng(lat, long),
            destination: PointLatLng(-15.5447, -47.3410),
            mode: TravelMode.driving),
        googleApiKey: GOOGLE_MAPS_API_KEY);

    if (result.points.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    return listLatLng = polylineCoordinates;
  }
}
