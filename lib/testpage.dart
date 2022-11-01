import 'package:flutter/material.dart';
import 'HeroProduct.dart';
import 'DetailScreen.dart';
import 'ProductSlider.dart';
import 'category.dart';
import 'RecentProduct.dart';
import 'package:sizer/sizer.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final productList = [
    {
      'name': 'บ้านโมเดิร์นโครงการใหม่',
      'image': 'assets/images/house6.jpg',
      'price': '20,000,000',
      'disc': 'Pomero',
    },
    {
      'name': 'บ้านเดี่ยวสองชั้น',
      'image': 'assets/images/house5.jpg',
      'price': '3,000,000',
      'disc': 'Sodaice',
    },
    {
      'name': 'Sneaker',
      'image': 'assets/images/house4.jpg',
      'price': '72,000,000',
      'disc': 'IDK',
    },
    {
      'name': 'Blue Sneaker',
      'image': 'assets/images/house3.jpg',
      'price': '11,000,000',
      'disc': 'Dunno',
    },
    {
      'name': 'IKEA Bag',
      'image': 'assets/images/house2.jpg',
      'price': 80,
      'disc': 'TopKEK',
    },
    {
      'name': 'HILLIGT',
      'image': 'assets/images/house1.jpg',
      'price': 80,
      'disc': 'Material: No matter what you ask I dunno',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SafeArea(
              child: ListView(
            children: [
              ProductSlider(),
              SizedBox(height: 2.h),
              Row(
                children: [
                  SizedBox(
                    width: 2.5.w,
                  ),
                  Text(
                    "Homedi Real Estate & Property",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 71, 69, 69)),
                  ),
                  SizedBox(
                    width: 2.5.w,
                  ),
                  Text('2 items found', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Sort',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Size',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Type',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                child: Category(),
              ),
              SizedBox(height: 0.h),
              Container(
                height: 60.h,
                child: GridView.builder(
                  itemCount: 2,
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: index,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/house${index + 1}.jpg",
                                height: 300),
                            Text(
                              '฿5,290,000',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 104, 103, 103),
                                  fontSize: 16.sp),
                            ),
                            Text(
                              'บ้านเดี่ยว โครงการ Homedi ',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              'Homedi Ville',
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //Container(height: 60.h, child: RecentProduct()), old recent product part
            ],
          )),
        );
      },
    );
  }
}

class RecentSingleProduct extends StatelessWidget {
  final recent_single_prod_name;
  final recent_single_prod_image;
  final recent_single_prod_price;
  final recent_single_prod_disc;

  RecentSingleProduct({
    this.recent_single_prod_name,
    this.recent_single_prod_image,
    this.recent_single_prod_price,
    this.recent_single_prod_disc,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(recent_single_prod_image),
    );
  }
}
