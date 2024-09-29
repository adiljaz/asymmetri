import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'speedslider.dart';
import 'mydata.dart';

class ProgressBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ProgressController>(
      builder: (controller) {
        int totalItems =
            controller.totalItems.value > 0 ? controller.totalItems.value : 1;
        int itemsPerLine = controller.itemsPerLine.value > 0
            ? controller.itemsPerLine.value
            : 1;
        int totalLines = (totalItems / itemsPerLine).ceil();
        return Column(
          children: List.generate(totalLines, (lineIndex) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: List.generate(itemsPerLine, (itemIndex) {
                  int globalIndex = lineIndex * itemsPerLine + itemIndex;
                  if (globalIndex < totalItems) {
                    return Expanded(
                      child: Container(
                        height: 20,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: controller.selectedColor.value),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: controller.getProgressWidth(globalIndex),
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              LinearGradient(
                                
                                colors: [
                                  MyData.gradientStartColor.value,
                                  MyData.gradientEndColor.value,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).colors[0], 
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(child: SizedBox());
                  }
                }),
              ),
            );
          }),
        );
      },
    );
  }
}
