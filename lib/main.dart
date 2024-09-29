import 'package:asymmetri_assesment/speedslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'myfuntion.dart';

void main() {
  Get.put(ColorController());
  Get.put(ProgressController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asymmetri Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}