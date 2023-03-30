import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";

class Global {
  static final url = dotenv.env['BACKEND_URL'];
  static const darkGreen = Color.fromARGB(255, 57, 122, 76);
  static const mediumGreen = Color.fromARGB(255, 86, 147, 88);
  static const green = Color.fromARGB(255, 119, 192, 99);
  static const lightGreen = Color.fromARGB(255, 190, 216, 146);
  static const white = Colors.white;
  static const lightGrey = Color.fromARGB(255, 224, 227, 214);
  static const mediumGrey = Colors.black54;
  static const darkGrey = Color.fromARGB(255, 32, 32, 31);
  static const markerColor = Color.fromARGB(255, 185, 20, 20);
}
