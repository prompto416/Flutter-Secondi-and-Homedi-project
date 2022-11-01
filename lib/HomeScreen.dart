import 'package:flutter/material.dart';
import 'pages/daily_new.dart';
import 'package:secondi_sample_space/testpage.dart';
import 'HomeBody.dart';
import 'screens/blue_screen.dart';
import 'screens/green_screen.dart';
import 'screens/red_screen.dart';
import 'screens/yellow_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/account.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:sizer/sizer.dart';
import 'category_page.dart';
import 'pages/login_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  int _currentIndex = 0;
  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/nav1.png', width: 50, height: 50),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(Icons.manage_search_outlined, size: 45), label: 'Category'),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.cartPlus, size: 30),
      label: 'New',
    ),
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.user,
          size: 30,
        ),
        label: 'Me'),
  ];
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 8.5.h,
            backgroundColor: Colors.white,
            title: Container(
              width: 150.w,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 0.w,
                      ),
                      IconButton(
                        iconSize: 3.5.h,
                        icon: Icon(
                          FontAwesomeIcons.envelope,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 4.h,
                          width: 500.w,
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: Container(
                                width: 10.w,
                                height: 20,
                                child: Row(children: [
                                  IconButton(
                                    iconSize: 3.8.w,
                                    onPressed: () {},
                                    icon: Icon(FontAwesomeIcons.camera),
                                  ),
                                ]),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Search',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        //width: 27.w,
                        width: 0.w,
                      ),
                      // IconButton(
                      //   iconSize: 2.h,
                      //   icon: Icon(
                      //     FontAwesomeIcons.camera,
                      //     color: Colors.grey,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      IconButton(
                        iconSize: 3.h,
                        icon: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        iconSize: 3.h,
                        icon: Icon(
                          FontAwesomeIcons.shoppingBasket,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            children: [
              //CategoryPage(),
              TestPage(),
              CategoryPage(),
              DailyNew(),
              //RedScreen(),
              //LoginPage(),
              Account(),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 12.5.h,
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                items: _bottomNavigationBarItems,
                backgroundColor: Colors.white,
                //selectedItemColor: Color.fromARGB(195, 143, 163, 28),
                selectedItemColor: Colors.blue,
                onTap: (index) {
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                elevation: 0.0,
                type: BottomNavigationBarType.fixed),
          ),
        );
      },
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HomeBody(),
//     );
//   }
// }
