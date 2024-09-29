import 'package:asymmetri_assesment/speedslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'myfuntion.dart';

class ItemCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ProgressController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Total Items',
                labelStyle: TextStyle(color: controller.selectedColor.value),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: controller.selectedColor.value),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: controller.selectedColor.value.withOpacity(0.5)),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  MyFunctions.updateTotalItems(int.parse(value));
                }
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Items in Line',
                labelStyle: TextStyle(color: controller.selectedColor.value),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: controller.selectedColor.value),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: controller.selectedColor.value.withOpacity(0.5)),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  MyFunctions.updateItemsPerLine(int.parse(value));
                }
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reverse', style: TextStyle(color: controller.selectedColor.value)),
                Switch(
                  value: controller.isReversed.value,
                  onChanged: (value) {
                    MyFunctions.toggleReverse();
                  },
                  activeColor: controller.selectedColor.value,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}