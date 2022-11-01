import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  TextEditingController textController = TextEditingController();
  double buttonWidth = 42;

  final myCategory = [
    [
      {
        'name': 'บ้านแฝด',
        'image': 'assets/images/cat_twin.jpg',
      },
      {
        'name': 'บ้านเดี่ยว',
        'image': 'assets/images/house5.jpg',
      },
      {
        'name': 'ทาวน์โฮม',
        'image': 'assets/images/catTown.jpg',
      },
    ],
    [
      {'name': 'คอนโด', 'image': 'assets/images/catCondo.jpg'},
      {'name': 'อพาร์ทเมนท์', 'image': 'assets/images/catApartment.jpg'}
    ],
    [
      {'name': 'อาคารพาณิชย์', 'image': 'assets/images/catPanit.jpg'},
      {'name': 'ที่ดิน', 'image': 'assets/images/catLand.jpg'}
    ]
  ];
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    height: 10.h,
                    decoration: BoxDecoration(color: Colors.white),
                    child: TabBar(
                      controller: _controller,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black38,
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          text: 'HOUSE',
                        ),
                        Tab(
                          text: 'CONDO',
                        ),
                        Tab(
                          text: 'OTHERS',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90.h,
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                            itemCount: myCategory[0].length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 3.w,
                                    mainAxisSpacing: 5.h),
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(myCategory[0][index]
                                            ['image'] ??
                                        'images/prod1.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Text(
                                  myCategory[0][index]['name'] ?? '',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                            itemCount: myCategory[1].length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 3.w,
                                    mainAxisSpacing: 5.h),
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(myCategory[1][index]
                                            ['image'] ??
                                        'images/prod1.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Text(myCategory[1][index]['name'] ?? '',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                            itemCount: myCategory[2].length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 3.w,
                                    mainAxisSpacing: 5.h),
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(myCategory[2][index]
                                            ['image'] ??
                                        'images/prod1.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Text(myCategory[2][index]['name'] ?? '',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
