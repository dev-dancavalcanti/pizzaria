import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzaria/src/features/orders/controllers/orders_map_controller.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersMapController mapController =
        context.watch<OrdersMapController>();
    return Scaffold(
        body: ChangeNotifierProvider.value(
      value: mapController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 250,
              child: GoogleMap(
                onMapCreated: (controller) {
                  mapController.onMapController(controller);
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(mapController.lat, mapController.long),
                    zoom: 13),
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: {
                  Marker(
                      markerId: MarkerId("_clientLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(-15.5409, -47.3229))
                },
                polylines: Set<Polyline>.of(mapController.polylines.values),
              ),
            ),
          ),
          Text(mapController.json.rows?[0].elements![0].distance?.text ?? ''),
          Text(mapController.json.rows?[0].elements![0].duration?.text ?? ''),
        ],
      ),
    ));
  }
}
