import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:logger/logger.dart";

class Global {
  static final logger = Logger();

  static final url = dotenv.env['BACKEND_URL'];
  static const mapUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const darkGreen = Color.fromARGB(255, 57, 122, 76);
  static const mediumGreen = Color.fromARGB(255, 86, 147, 88);
  static const green = Color.fromARGB(255, 119, 192, 99);
  static const lightGreen = Color.fromARGB(255, 190, 216, 146);
  static const white = Colors.white;
  static const backgroundColor = Color.fromRGBO(249, 251, 255, 1);
  static const lightGrey = Color.fromARGB(255, 226, 228, 229);
  static const mediumGrey = Color.fromARGB(255, 121, 121, 121);
  static const darkGrey = Color.fromARGB(255, 32, 32, 31);
  static const markerColor = Color.fromARGB(255, 185, 20, 20);
  static const transparent = Colors.transparent;
  static const food = Color.fromARGB(255, 236, 221, 152);
  static const medication = Color.fromARGB(255, 163, 216, 175);
  static const clothes = Color.fromARGB(255, 226, 142, 170);
  static const electronics = Color.fromARGB(255, 113, 176, 228);
  static const other = Color.fromARGB(255, 166, 130, 196);
}
