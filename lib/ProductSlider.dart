import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sizer/sizer.dart';

class ProductSlider extends StatefulWidget {
  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          height: 150,
          child: Carousel(
            images: [
              AssetImage('assets/images/house4.jpg'),
              AssetImage('assets/images/house3.jpg'),
              AssetImage('assets/images/house2.jpg'),
              AssetImage('assets/images/house6.jpg'),
            ],
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(
              milliseconds: 800,
            ),
          ),
        );
      },
    );
  }
}
