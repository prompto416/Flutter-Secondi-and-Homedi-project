import 'package:flutter/material.dart';
import 'package:secondi_sample_space/constants.dart';
import 'package:sizer/sizer.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 2.w,
              ),
              CategoryProduct(
                press: () {},
                image: 'assets/images/prod5.jpeg',
                text: 'All',
              ),
              SizedBox(
                width: 10.w,
              ),
              CategoryProduct(
                press: () {},
                image: 'assets/images/prod1.jpeg',
                text: 'Houses',
              ),
              SizedBox(
                width: 10.w,
              ),
              CategoryProduct(
                press: () {},
                image: 'assets/images/prod3.jpeg',
                text: 'Town House',
              ),
              SizedBox(
                width: 10.w,
              ),
              CategoryProduct(
                press: () {},
                image: 'assets/images/prod7.jpeg',
                text: 'Condo',
              ),
            ],
          ),
        );
      },
    );
  }
}

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String image, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: press,
            child: Container(
              child: Chip(
                  backgroundColor: Colors.blue,
                  label: Container(
                    width: 170.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          child: Text(
                            text,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        // Image.asset(
                        //   image,
                        //   height: 30,
                        // ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
