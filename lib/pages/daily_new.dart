import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DailyNew extends StatefulWidget {
  DailyNew({Key? key}) : super(key: key);

  @override
  State<DailyNew> createState() => _DailyNewState();
}

class _DailyNewState extends State<DailyNew> {
  final newProducts = [
    {
      'address': 'บางพลี, สมุทรปราการ',
      'price': '฿ 1,999,999',
      'contact': '081-123-456',
      'image': 'assets/images/house1.jpg'
    },
    {
      'address': 'บางพลี2, สมุทรปราการ2',
      'price': '฿ 1,999,999,200',
      'contact': '081-123-4562',
      'image': 'assets/images/house2.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house4.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
    {
      'address': 'บางพลี4, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
    {
      'address': 'บางพลี3, สมุทรปราการ3',
      'price': '฿ 100,999,999',
      'contact': '081-123-4563',
      'image': 'assets/images/house3.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Column(children: [
            Center(
              child: Container(
                width: 100.w,
                height: 16.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/daily_new.jpg'),
                        fit: BoxFit.cover)),
                child: Text(
                  'DAILY NEW',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                itemCount: newProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Image.asset(
                            newProducts[index]['image'] ??
                                'assets/images/prod1.jpeg',
                            width: 40.w,
                            height: 20.h,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              newProducts[index]['price'] ?? '฿100,000',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(newProducts[index]['address'] ?? 'No address',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                )),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                                newProducts[index]['contact'] ??
                                    'No contact Provided',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                )),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('โทร'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'อีเมล',
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
        );
      },
    );
  }
}
