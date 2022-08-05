import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUbication extends StatefulWidget {
  const MapUbication({Key? key, required this.lat, required this.lng})
      : super(key: key);

  final double lat;
  final double lng;

  @override
  State<MapUbication> createState() => _MapUbicationState();
}

class _MapUbicationState extends State<MapUbication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubicación"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GoogleMap(
          markers: {
            Marker(
              markerId: const MarkerId("1"),
              position: LatLng(widget.lat, widget.lng),
            ),
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.lng),
            zoom: 18,
          ),
        ),
      ),
    );
  }
}
