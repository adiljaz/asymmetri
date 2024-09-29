import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyData {
  static final List<String> colors = ['Purple', 'Blue', 'Red', 'Green', 'Yellow'];
  static final Rx<Color> gradientStartColor = Colors.purple[300]!.obs;
  static final Rx<Color> gradientEndColor = Colors.purple[900]!.obs;
  static const String logoUrl = 'https://i.ibb.co/dbB2qtK/2-Assymetri-White-on-black.png';

  static void updateColors(String color) {
    switch (color) {
      case 'Purple':
        gradientStartColor.value = Colors.purple[300]!;
        gradientEndColor.value = Colors.purple[900]!;
        break;
      case 'Blue':
        gradientStartColor.value = Colors.blue[300]!;
        gradientEndColor.value = Colors.blue[900]!;
        break;
      case 'Red':
        gradientStartColor.value = Colors.red[300]!;
        gradientEndColor.value = Colors.red[900]!;
        break;
      case 'Green':
        gradientStartColor.value = Colors.green[300]!;
        gradientEndColor.value = Colors.green[900]!;
        break;
      case 'Yellow':
        gradientStartColor.value = Colors.yellow[300]!;
        gradientEndColor.value = Colors.yellow[900]!;
        break;
    }
  }

  static Color getColorFromName(String colorName) {
    switch (colorName) {
      case 'Purple':
        return Colors.purple;
      case 'Blue':
        return Colors.blue;
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Yellow':
        return Colors.yellow;
      default:
        return Colors.purple;
    }
  }
}