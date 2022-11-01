import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sizer/sizer.dart';
import 'forgot_password.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Center(
                  child: Column(children: [
                    //img
                    SizedBox(
                        height: 55.h,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/welcome_img.jpg"))),
                        )),
                    //login signup row

                    //username password box
                    Padding(
                      padding: EdgeInsets.only(
                          top: 3.h, left: 7.5.w, bottom: 0, right: 7.5.w),
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFFC3D162))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFFC3D162))),
                            hintText: 'Username',
                            hintStyle: TextStyle(fontSize: 12.sp),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2.5.h, horizontal: 5.w)),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.5.h, horizontal: 7.5.w),
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFFC3D162))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    width: 3, color: Color(0xFFC3D162))),
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
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFC3D162)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                        ),
                        child: const Text(
                          'Log In',
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
                            width: 10.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0)),
                                child: Image.asset(
                                    'assets/images/line_login.png')),
                          ),
                          SizedBox(
                            width: 10.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0)),
                                child: Image.asset(
                                    'assets/images/facebook_login.png')),
                          ),
                          SizedBox(
                            width: 10.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0)),
                                child: Image.asset(
                                    'assets/images/google_login.png')),
                          ),
                          SizedBox(
                            width: 10.w,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0),
                                    primary: Colors.white),
                                child: Image.asset(
                                    'assets/images/apple_login.png')),
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
                                      builder: (context) =>
                                          ForgotPasswordPage()),
                                );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.black38,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                              child: const Text('Sign Up')),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
