import 'package:flutter/material.dart';
import 'colorselect.dart';
import 'counter.dart';
import 'progressbar.dart';
import 'mydata.dart';
import 'speedslider.dart';

class HomePage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AsymmetriLogo(),
                    SizedBox(height: 20),
                    ColorSelector(),
                    SizedBox(height: 20),
                    SpeedSlider(),
                    SizedBox(height: 20),
                    ItemCounter(),
                    SizedBox(height: 20),
                    ProgressBars(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AsymmetriLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        MediaQueryData mediaquery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        fit: BoxFit.cover,
        MyData.logoUrl,
        height:mediaquery.size.height*0.13,
        width:mediaquery.size.width*0.5 ,
      ),
    );
  }
}
