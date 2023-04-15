import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/widgets/textfield.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = "/map";
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final LatLng _initialPosition = LatLng(33.9009165, 35.4793445);
  bool _currentPositionActivated = false;
  late final List<Marker> _markers = [
    Marker(
      point: _initialPosition,
      width: 80,
      height: 80,
      builder: (context) => _buildMarkerIcon(),
    ),
  ];

  final List<Map<String, dynamic>> _centers = [
    {
      "id": 1,
      "lat": 33.9301140,
      "long": 35.5914950,
      "name": "Sweet tooth pharmacy",
      "description": "very gud donation center"
    },
    {
      "id": 2,
      "lat": 33.9302450,
      "long": 35.5911975,
      "name": "Ubi's nice donation center",
      "description": "very gud donation center"
    },
    {
      "id": 3,
      "lat": 33.9302241,
      "long": 35.5912971,
      "name": "Buni's nice donation center",
      "description": "very gud donation center"
    },
    {
      "id": 4,
      "lat": 33.9301241,
      "long": 35.5812971,
      "name": "Dummy donation center",
      "description": "very gud donation center"
    },
    {
      "id": 5,
      "lat": 33.9302541,
      "long": 35.5902971,
      "name": "Donation center dummy",
      "description": "very gud donation center"
    },
  ];

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
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: SearchBar(
              searchMode: SearchMode.onlyDonationCenters,
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Global.white,
            onPressed: () {
              determinePosition(context).then(
                (value) {
                  final LatLng coords = LatLng(value.latitude, value.longitude);
                  _mapController.move(coords, 17.0);
                  setState(() {
                    _currentPositionActivated = true;
                    _markers.add(
                      Marker(
                        point: coords,
                        width: 80.0,
                        height: 80.0,
                        builder: (context) => _buildMarkerIcon(),
                      ),
                    );
                  });
                },
              );
            },
            child: const Icon(
              Icons.my_location,
              color: Global.darkGreen,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Global.mediumGreen,
            onPressed: () {
              if (_currentPositionActivated) {
                _addNearbyDonationCenters();
              } else {
                showSnackBar(context, 'Select your current location');
              }
            },
            child: const FaIcon(
              FontAwesomeIcons.angleUp,
              color: Global.white,
            ),
          ),
        ],
      ),
    );
  }

  void _addNearbyDonationCenters() => setState(() {
        for (var e in _centers) {
          _markers.add(
            Marker(
              point: LatLng(e["lat"], e["long"]),
              width: 80.0,
              height: 80.0,
              builder: (context) => _buildMarkerIcon(),
            ),
          );
        }
      });

  Widget _buildMarkerIcon() => const Icon(
        Icons.location_pin,
        color: Global.markerColor,
        size: 42,
      );
}
