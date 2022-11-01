import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        images: [
          AssetImage('assets/images/slider1.jpeg'),
          AssetImage('assets/images/slider2.jpeg'),
          AssetImage('assets/images/slider3.jpeg'),
        ],
        borderRadius: true,
        radius: Radius.circular(30),
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        dotIncreasedColor: Colors.grey,
        animationDuration: Duration(
          milliseconds: 800,
        ),
      ),
    );
  }
}
