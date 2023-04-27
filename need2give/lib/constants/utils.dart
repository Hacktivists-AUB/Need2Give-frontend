import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:need2give/constants/global.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<Position> determinePosition(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // ignore: use_build_context_synchronously
    showSnackBar(context, "Please enable location services");
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

String parseParams(Map<String, dynamic> params) {
  return "?${params.entries.map((entry) => "${entry.key}=${entry.value}").join("&")}";
}

Color getCategoryColor(String category) {
  if (category == "food") {
    return Global.food;
  } else if (category == "medication") {
    return Global.medication;
  } else if (category == "electronics") {
    return Global.electronics;
  } else if (category == "clothes") {
    return Global.clothes;
  } else if (category == "other") {
    return Global.other;
  } else {
    return const Color.fromARGB(255, 252, 205, 134);
  }
}
