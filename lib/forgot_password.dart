import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: const BackButton(color: Color(0xFFC3D162)),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Center(
              child: Column(children: [
                //login signup row
                // const SizedBox(
                //   height: 60,
                //   child: Text('LOGO'),
                // ),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 50,
                  child: Text('Enter your registered Email'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                  child: SizedBox(
                      height: 50,
                      child: Text(
                          'we will send an email with intructions to reset your password.')),
                ),
                //username password box

                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 10, top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        hintText: 'Email',
                        contentPadding: EdgeInsets.only(left: 30)),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //login button
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFC3D162)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
