import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              SizedBox(height: 200),
              // Profile Image
              Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(width: 20),
              // Name
              Column(
                children: const [
                  Text(
                    'Hi, John Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              // Add crown icon next to name
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                child: Icon(
                  FontAwesomeIcons.crown,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              // Container(
              //   color: Colors.green,
              //   width: 20,
              //   height: 20,
              //   child: SvgPicture.asset('assets/images/crown.svg'),
              // )
            ],
          ),
        ),
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text(
                'My Order',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 225),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox.fromSize(
            size: Size(100, 60),
            child: ClipRect(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.wallet,
                        color: Colors.grey,
                      ), // <-- Icon
                      SizedBox(height: 3),
                      Text("ที่ต้องชำระเงิน"), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(85, 60),
            child: ClipRect(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.box,
                        color: Colors.grey,
                      ), // <-- Icon
                      SizedBox(height: 3),
                      Text("ที่ต้องจัดส่ง"), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(85, 60),
            child: ClipRect(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.truck,
                        color: Colors.grey,
                      ), // <-- Icon
                      SizedBox(height: 3),
                      Text("ที่ต้องได้รับ"), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size(85, 60),
            child: ClipRect(
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.star,
                        color: Colors.grey,
                      ), // <-- Icon
                      SizedBox(height: 3),
                      Text("ให้คะแนน"), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.heart),
                    const SizedBox(width: 10),
                    Text("สิ่งที่ฉันถูกใจ", style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.clock),
                    const SizedBox(width: 10),
                    Text("ดูล่าสุด", style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.star),
                    const SizedBox(width: 10),
                    Text("คะแนนของฉัน", style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 5),
              ]),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.user),
                        const SizedBox(width: 10),
                        Text("ตั้งค่าบัญชี", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.questionCircle),
                        const SizedBox(width: 10),
                        Text("ศูนย์ช่วยเหลือ", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.headset),
                        const SizedBox(width: 10),
                        Text("Chat", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ]),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text("Address Book", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.wallet,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text("My Wallet", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
