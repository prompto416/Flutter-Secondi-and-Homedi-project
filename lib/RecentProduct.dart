import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RecentProduct extends StatelessWidget {
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
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return RecentSingleProduct(
            recent_single_prod_disc: productList[index]['disc'],
            recent_single_prod_name: productList[index]['name'],
            recent_single_prod_image: productList[index]['image'],
            recent_single_prod_price: productList[index]['price'],
          );
        });
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
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Column(
          children: [
            Image.asset(
              recent_single_prod_image,
              height: 50.h,
              width: 250.w,
            ),
            ListTile(
              title:
                  Text(recent_single_prod_name, style: TextStyle(fontSize: 15)),
              subtitle: Text(
                  '${recent_single_prod_disc}\n\฿${recent_single_prod_price}'),
            ),
          ],
        );
      },
    );
  }
}
