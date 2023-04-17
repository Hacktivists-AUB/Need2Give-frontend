import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';

class LocationPicker extends StatefulWidget {
  final Function(LatLng) onConfirm;
  const LocationPicker({
    super.key,
    required this.onConfirm,
  });

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final MapController _mapController = MapController();
  final LatLng _initialPosition = LatLng(33.9009165, 35.4793445);
  LatLng _selectedLocation = LatLng(33.9009165, 35.4793445);
  late final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Text(
          "Select a location",
          style: TextStyle(fontSize: 18),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      content: Container(
        height: 420,
        color: Colors.white,
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                zoom: 13.0,
                maxZoom: 18.0,
                center: _initialPosition,
              ),
              children: [
                TileLayer(
                  minZoom: 8,
                  maxZoom: 18.0,
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: _markers,
                ),
                GestureDetector(
                  onDoubleTap: () {
                    LatLng pressedLocation = _mapController.center;
                    setState(() {
                      _markers.clear();
                      _markers.add(
                        Marker(
                          width: 40.0,
                          height: 40.0,
                          point: pressedLocation,
                          builder: (ctx) => _buildMarkerIcon(),
                        ),
                      );
                      _selectedLocation = pressedLocation;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Global.white,
                onPressed: () {
                  determinePosition(context).then(
                    (value) {
                      final LatLng coords =
                          LatLng(value.latitude, value.longitude);
                      _selectedLocation = coords;
                      _mapController.move(coords, 17.0);
                      _markers.clear();
                      _markers.add(
                        Marker(
                          point: coords,
                          width: 80.0,
                          height: 80.0,
                          builder: (context) => _buildMarkerIcon(),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.my_location,
                  color: Global.darkGreen,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            widget.onConfirm(_selectedLocation);
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  Widget _buildMarkerIcon() => const Icon(
        Icons.location_pin,
        color: Global.markerColor,
        size: 42,
      );
}
