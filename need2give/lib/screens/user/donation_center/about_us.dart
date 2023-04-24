import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';

class AboutUs extends StatelessWidget {
  final DonationCenter donationCenter;
  AboutUs({
    super.key,
    required this.donationCenter,
  });

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    LatLng location = LatLng(donationCenter.latitude, donationCenter.longitude);

    return Container(
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          const Text(
            "Reach out to us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Global.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.mail,
                color: Global.mediumGrey,
              ),
              const SizedBox(width: 8),
              Text(
                donationCenter.email,
                style: const TextStyle(
                  color: Global.mediumGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Global.mediumGrey,
              ),
              const SizedBox(width: 8),
              Text(
                (donationCenter.phoneNumber == null ||
                        donationCenter.phoneNumber == "")
                    ? "N/A"
                    : donationCenter.phoneNumber!,
                style: const TextStyle(
                  color: Global.mediumGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            "You're welcome to visit us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Global.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "We are open every ${_parseOpeningDays(donationCenter.openingDays)}",
            style: const TextStyle(
              color: Global.mediumGrey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.av_timer,
                color: Global.mediumGrey,
              ),
              const SizedBox(width: 8),
              Text(
                "${donationCenter.openingTime} - ${donationCenter.closingTime}",
                style: const TextStyle(
                  color: Global.mediumGrey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Global.mediumGrey,
              ),
              TextButton(
                onPressed: () {
                  _showLocationOnMap(context, location);
                },
                child: const Text(
                  "See location on map",
                  style: TextStyle(
                    color: Global.green,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 8),
          const Text(
            "A bit about us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Global.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            donationCenter.description,
            style: const TextStyle(
              color: Global.mediumGrey,
            ),
          ),
        ],
      ),
    );
  }

  String _parseOpeningDays(Map<String, dynamic> days) {
    String res = "";
    days.forEach((key, value) {
      if (value) {
        res += "${key[0].toUpperCase() + key.substring(1)}, ";
      }
    });
    if (res.isNotEmpty) {
      res = res.substring(0, res.length - 2);
    }
    return res;
  }

  void _showLocationOnMap(BuildContext ctx, LatLng location) =>
      showGeneralDialog(
        context: ctx,
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return AlertDialog(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                "See location",
                style: TextStyle(fontSize: 18),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            content: _buildMap(location),
            actions: [
              TextButton(
                child: const Text(
                  "Close",
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          );
        },
      );

  SizedBox _buildMap(LatLng location) {
    return SizedBox(
      height: 420,
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          zoom: 13.0,
          maxZoom: 18.0,
          center: location,
        ),
        children: [
          TileLayer(
            minZoom: 8,
            maxZoom: 18.0,
            urlTemplate: Global.mapUrl,
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: location,
                builder: (ctx) => const Icon(
                  Icons.location_pin,
                  color: Global.markerColor,
                  size: 42,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
