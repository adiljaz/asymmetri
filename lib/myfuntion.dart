import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'mydata.dart';
import 'speedslider.dart';

class MyFunctions {
  static void updateColor(String colorName) {
    Get.find<ColorController>().updateColor(colorName);
    Color newColor = MyData.getColorFromName(colorName);
    Get.find<ProgressController>().updateColor(newColor);
    MyData.updateColors(colorName);
  }

  static void updateTotalItems(int value) {
    Get.find<ProgressController>().updateTotalItems(value);
  }

  static void updateItemsPerLine(int value) {
    Get.find<ProgressController>().updateItemsPerLine(value);
  }

  static void toggleReverse() {
    Get.find<ProgressController>().toggleReverse();
  }

  static void updateSpeed(double value) {
    Get.find<ProgressController>().updateSpeed(value);
  }
}

class ColorController extends GetxController {
  final Rx<String> selectedColorName = 'Purple'.obs;
  final Rx<Color> selectedColor = Colors.purple.obs;

  void updateColor(String colorName) {
    selectedColorName.value = colorName;
    selectedColor.value = MyData.getColorFromName(colorName);
  }
}