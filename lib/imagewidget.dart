import 'package:flutter/material.dart';
import 'mydata.dart';

class AsymmetriLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Image.network(
        MyData.logoUrl,
        height: 50,
      ),
    );
  }
}
