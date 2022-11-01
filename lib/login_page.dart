import 'package:flutter/material.dart';
import 'pages/forgot_password.dart';
import 'pages/register_page.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Column(children: [
          //img
          SizedBox(
              height: 10,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/welcome_img.jpg",
                        ))),
              )),
          //login signup row

          //username password box
          Padding(
            padding:
                EdgeInsets.only(top: 3.h, left: 7.5.w, bottom: 0, right: 7.5.w),
            child: TextField(
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xFFC3D162))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  hintText: 'Username',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w)),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 7.5.w),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      borderSide:
                          const BorderSide(width: 3, color: Color(0xFFC3D162))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.5.h,
                    horizontal: 5.w,
                  )),
            ),
          ),
          //login button
          SizedBox(
            height: 5.h,
            width: 40.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFC3D162)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                )),
              ),
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            width: 65.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 8.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0)),
                      child: Image.asset('assets/images/line_login.png')),
                ),
                SizedBox(
                  width: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 8.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0)),
                      child: Image.asset('assets/images/facebook_login.png')),
                ),
                SizedBox(
                  width: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 8.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0)),
                      child: Image.asset('assets/images/google_login.png')),
                ),
                SizedBox(
                  width: SizerUtil.deviceType == DeviceType.mobile ? 10.w : 8.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(0),
                          primary: Colors.white),
                      child: Image.asset('assets/images/apple_login.png')),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            width: 60.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black38, fontSize: 10.sp),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 10.sp),
                    )),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
