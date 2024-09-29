import 'package:asymmetri_assesment/widgets/speedslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/home.dart';
import 'functions/myfuntion.dart';

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