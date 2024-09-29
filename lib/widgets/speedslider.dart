import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../functions/myfuntion.dart';

class SpeedSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ProgressController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(height: 8),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: controller.selectedColor.value,
                inactiveTrackColor: controller.selectedColor.value.withOpacity(0.3),
                thumbColor: controller.selectedColor.value,
                overlayColor: controller.selectedColor.value.withOpacity(0.4),
                valueIndicatorColor: controller.selectedColor.value,
                valueIndicatorTextStyle: TextStyle(color: Colors.white),
              ),
              child: Slider(
                value: controller.speed.value,
                min: 0,
                max: 2,
                divisions: 2,
                label: _getSpeedLabel(controller.speed.value),
                onChanged: (value) => MyFunctions.updateSpeed(value),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getSpeedLabel(double value) {
    if (value == 0) return 'Slow';
    if (value == 1) return 'Smooth';
    if (value == 2) return 'Fast';
    return '';
  }
}

class ProgressController extends GetxController {
  final RxBool isReversed = false.obs;
  final RxInt totalItems = 1.obs;
  final RxInt itemsPerLine = 1.obs;
  final RxDouble progressPercentage = 0.0.obs;
  final RxDouble speed = 1.0.obs;
  final Rx<Color> selectedColor = Colors.purple.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }

  void updateColor(Color color) {
    selectedColor.value = color;
  }

  void updateTotalItems(int value) {
    totalItems.value = value;
  }

  void updateItemsPerLine(int value) {
    itemsPerLine.value = value;
  }

  void toggleReverse() {
    isReversed.toggle();
    progressPercentage.value = isReversed.value ? 1.0 : 0.0;
  }

  void updateSpeed(double value) {
    speed.value = value;
  }

  void startAnimation() {
    _animate();
  }

  void _animate() {
    double step;
    int delay;

    switch (speed.value.toInt()) {
      case 0: // Slow
        step = 0.005;
        delay = 50;
        break;
      case 1: // Smooth
        step = 0.01;
        delay = 30;
        break;
      case 2: // Fast
        step = 0.02;
        delay = 20;
        break;
      default:
        step = 0.01;
        delay = 30;
    }

    Future.delayed(Duration(milliseconds: delay), () {
      if (isReversed.value) {
        progressPercentage.value -= step;
        if (progressPercentage.value <= 0) {
          progressPercentage.value = 1.0;
        }
      } else {
        progressPercentage.value += step;
        if (progressPercentage.value >= 1) {
          progressPercentage.value = 0.0;
        }
      }
      _animate();
    });
  }

  double getProgressWidth(int itemIndex) {
    double itemWidth = 1.0 / totalItems.value;
    double startPosition = itemIndex * itemWidth;
    double endPosition = startPosition + itemWidth;

    if (progressPercentage.value >= startPosition &&
        progressPercentage.value <= endPosition) {
      return (progressPercentage.value - startPosition) / itemWidth;
    } else if (progressPercentage.value > endPosition) {
      return 1.0;
    } else {
      return 0.0;
    }
  }
} 