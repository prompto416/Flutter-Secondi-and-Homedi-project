import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:secondi_sample_space/RecentProduct.dart';
import 'package:secondi_sample_space/testpage.dart';
import 'slider.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'category.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextEditingController textController = TextEditingController();
  double buttonWidth = 42;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                      height: 0.h,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.envelope,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    AnimSearchBar(
                      width: 60.w,
                      textController: textController,
                      onSuffixTap: () {
                        buttonWidth -= 100.w;
                      },
                      helpText: 'Search',
                    ),
                    SizedBox(
                      width: 44.w,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.shoppingBasket,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Category(),
              ],
            ),
          ),
        );
      },
    );
  }
}
