import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/textfield.dart';

class Map extends StatefulWidget {
  static const String routeName = "/map";
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  List<Marker> markers = [
    Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(37.7749, -122.4194),
      builder: (context) => const Icon(Icons.location_pin),
    ),
    Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(37.7730, -122.4226),
      builder: (context) => const Icon(Icons.location_pin),
    ),
  ];
  final LatLng _initialPosition = LatLng(33.9009165, 35.4793445);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              zoom: 13.0,
              maxZoom: 10000.0,
              center: _initialPosition,
            ),
            children: [
              TileLayer(
                minZoom: 8,
                maxZoom: 10000,
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _initialPosition,
                    width: 80,
                    height: 80,
                    builder: (context) => const Icon(
                      Icons.location_pin,
                      color: Global.markerColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Input(
              controller: _searchController,
              hintText: "Find a donation center",
              required: false,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.my_location,
          color: Global.white,
        ),
      ),
    );
  }
}
