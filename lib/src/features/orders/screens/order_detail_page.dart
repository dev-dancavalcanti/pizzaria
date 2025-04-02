import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_map_controller.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersMapController mapController = OrdersMapController();
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(mapController.lat, mapController.long), zoom: 16),
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      myLocationEnabled: true,
    ));
  }
}
