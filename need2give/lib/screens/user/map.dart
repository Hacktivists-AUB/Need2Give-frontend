import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/screens/user/donation_profile.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/widgets/textfield.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = "/map";
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final AccountService _accountService = AccountService();

  final LatLng _initialPosition = LatLng(33.9009165, 35.4793445);
  final int _radius = 500;

  late LatLng _currentPosition;
  late final List<Marker> _markers = [];

  bool _currentPositionActivated = false;
  List<DonationCenter> _centers = [];

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

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
                urlTemplate: Global.mapUrl,
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
          ),
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
                  _mapController.move(coords, 14.0);
                  setState(() {
                    _currentPositionActivated = true;
                    _currentPosition = coords;
                    _markers.add(
                      Marker(
                        point: coords,
                        width: 80.0,
                        height: 80.0,
                        builder: (context) => const Icon(
                          Icons.crisis_alert,
                          size: 42.0,
                          color: Global.darkGreen,
                        ),
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
                _mapController.move(_mapController.center, 12.0);
                _addNearbyDonationCenters(context);
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

  _loadNearbyDonationCenters(BuildContext ctx) async {
    _centers = await _accountService.get(
      ctx,
      {
        "latitude": _currentPosition.latitude,
        "longitude": _currentPosition.longitude,
        "radius": _radius,
      },
    );
    setState(() {});
  }

  void _addNearbyDonationCenters(BuildContext ctx) {
    _loadNearbyDonationCenters(ctx);
    setState(() {
      for (var e in _centers) {
        _markers.add(
          Marker(
            point: LatLng(e.latitude, e.longitude),
            width: 80.0,
            height: 80.0,
            builder: (context) => _buildMarkerIcon(
              ctx,
              responsive: true,
              center: e,
            ),
          ),
        );
      }
    });
  }

  Widget _buildMarkerIcon(
    BuildContext ctx, {
    bool responsive = true,
    DonationCenter? center,
  }) =>
      GestureDetector(
        onTap: () {
          if (!responsive) {
            return;
          }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  center!.name.length > 24
                      ? center.name.substring(0, 24)
                      : center.name,
                  style: const TextStyle(fontSize: 18),
                ),
                content: SizedBox(
                  height: 220,
                  child: _buildDialogContent(center),
                ),
                actions: [
                  TextButton(
                    child: const Text("Close"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    child: const Text("See more"),
                    onPressed: () => Navigator.pushNamed(
                      context,
                      DonationScreen.routeName,
                      arguments: center.id,
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.location_pin,
          size: 42.0,
          color: Global.markerColor,
        ),
      );

  ListView _buildDialogContent(DonationCenter center) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Global.green, width: 2.0),
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Global.white,
                child: Image.asset("assets/donation_center.png"),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "@${center.username}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(
              Icons.mail,
              color: Global.mediumGrey,
            ),
            const SizedBox(width: 8),
            Text(
              center.email.length > 18
                  ? "${center.email.substring(0, 18)}..."
                  : center.email,
              style: const TextStyle(
                color: Global.mediumGrey,
              ),
            ),
          ],
        ),
        if (!(center.phoneNumber == null || center.phoneNumber == ""))
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Global.mediumGrey,
                ),
                const SizedBox(width: 12),
                Text(
                  center.phoneNumber!,
                  style: const TextStyle(
                    color: Global.mediumGrey,
                  ),
                ),
              ],
            ),
          ),
        Row(
          children: [
            const Icon(
              Icons.roundabout_right,
              color: Global.mediumGrey,
            ),
            const SizedBox(width: 4),
            Text(
              "Distance: ${center.distance.toStringAsFixed(2)} ml",
              style: const TextStyle(
                color: Global.mediumGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Text(center.description),
      ],
    );
  }
}
