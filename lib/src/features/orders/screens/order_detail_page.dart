import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_map_controller.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersMapController mapController = OrdersMapController();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChangeNotifierProvider.value(
          value: mapController,
          child: Center(
            child: SizedBox(
              height: 250,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(mapController.lat, mapController.long),
                    zoom: 16),
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
