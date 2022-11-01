import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  const DetailScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Homedi Details'),
          ),
          body: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Row(
                    children: [
                      // SizedBox(
                      //   width: 65,
                      // ),
                      SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/house${widget.index + 1}.jpg",
                                  width: 100.w,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '฿5,290,000',
                                          style: TextStyle(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          textAlign: TextAlign.left,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '3',
                                              style: TextStyle(fontSize: 28),
                                              textAlign: TextAlign.left,
                                            ),
                                            IconButton(
                                              iconSize: 2.5.h,
                                              icon: Icon(
                                                FontAwesomeIcons.bed,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {},
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Text(
                                              '3',
                                              style: TextStyle(fontSize: 28),
                                              textAlign: TextAlign.left,
                                            ),
                                            IconButton(
                                              iconSize: 2.5.h,
                                              icon: Icon(
                                                FontAwesomeIcons.bathtub,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {},
                                            ),
                                            Text(
                                              '165 ตร.ม.',
                                              style: TextStyle(fontSize: 28),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'รายละเอียด',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'ประเภทอสังหาร: บ้านเดี่ยว ขาย\n\nเจ้าของโครงการ: Homedi\n',
                                          style: TextStyle(fontSize: 15.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          '\nพิ้นที่ใช้สอย: 165 ตร.ม\n\nราคาต่อตร.ม: ฿19,535/ตารางเมตร\n----------------------------------------------------------- ',
                                          style: TextStyle(fontSize: 15.sp),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 2.5.h,
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: IconButton(
                                                iconSize: 2.5.h,
                                                icon: Icon(
                                                  FontAwesomeIcons.envelope,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: IconButton(
                                                iconSize: 2.5.h,
                                                icon: Icon(
                                                  FontAwesomeIcons.heart,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: IconButton(
                                                iconSize: 2.5.h,
                                                icon: Icon(
                                                  FontAwesomeIcons.message,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Image.asset(
                        "assets/images/house${widget.index + 1}.jpg",
                      ),
                      Image.asset(
                        "assets/images/interior1.jpg",
                      ),
                      Image.asset(
                        "assets/images/interior3.jpg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
