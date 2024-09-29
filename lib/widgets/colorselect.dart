import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../functions/myfuntion.dart';
import '../data/mydata.dart';

class ColorSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ColorController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(13), 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: controller.selectedColorName.value,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.black54, size: 24),
                iconSize: 24,
                elevation: 0,
                style: TextStyle(color: Colors.black87, fontSize: 16),
                dropdownColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                borderRadius: BorderRadius.circular(8),
                items: MyData.colors.map((String colorName) {
                  return DropdownMenuItem<String>(
                    value: colorName,
                    child: Text(colorName),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    MyFunctions.updateColor(newValue);
                  }
                },
                focusColor: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }
}
