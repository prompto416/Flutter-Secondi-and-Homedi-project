import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _emailErrorMessage = '';
  String _confirmPass = '';
  bool _isPasswordMatched = false;
  bool _isPasswordLen = false;
  bool _isPasswordCapital = false;
  bool _isPasswordNumber = false;
  bool _isPasswordUsable = false;
  bool _isVisible = true;

  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: BackButton(color: Color(0xFFC3D162)),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
                const SizedBox(height: 0),
                //username password box
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        hintText: 'Username / ชื่อผู้ใช้',
                        contentPadding: EdgeInsets.only(left: 30)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 3, color: Color(0xFFC3D162))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 3, color: Color(0xFFC3D162))),
                      hintText: 'Email',
                      contentPadding: EdgeInsets.only(left: 30),
                    ),
                    onFieldSubmitted: (val) {
                      validateEmail(val);
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      _emailErrorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                      textAlign: TextAlign.start,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                  child: TextFormField(
                    onChanged: (password) => checkPassword(password),
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        hintText: 'Password / รหัสผ่าน',
                        contentPadding: const EdgeInsets.only(left: 30),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: !_isVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : Icon(Icons.visibility_off,
                                    color: Colors.grey))),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color:
                              _isPasswordUsable ? Colors.green : Colors.white,
                          border: _isPasswordUsable
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'A-Z, a-z , 0-9, or symbols ~`! @#\$%^&*()_-+={[}]|\\:;"\'\<\,\>.?/',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: _isPasswordLen ? Colors.green : Colors.white,
                          border: _isPasswordLen
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Contains at least 8 characters / ความยาวไม่น้อยกว่า 8 ตัวอักษร',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color:
                              _isPasswordNumber ? Colors.green : Colors.white,
                          border: _isPasswordNumber
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Contains at least 1 number / ตัวเลขไม่น้อยกว่า 1 ตัว',
                        style: TextStyle(fontSize: 12))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color:
                              _isPasswordCapital ? Colors.green : Colors.white,
                          border: _isPasswordCapital
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        'Contains at least 1 capital / ตัวพิมพ์ใหญ่ไม่น้อยกว่า 1 ตัว',
                        style: TextStyle(fontSize: 12))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (password) {
                      setState(() {
                        _isPasswordMatched = false;
                        if (password == _confirmPass) {
                          _isPasswordMatched = true;
                        }
                      });
                    },
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        hintText: 'Confirm Password / ยืนยันรหัสผ่าน',
                        contentPadding: EdgeInsets.only(left: 30)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color:
                              _isPasswordMatched ? Colors.green : Colors.white,
                          border: _isPasswordMatched
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        !_isPasswordMatched
                            ? "Password doesn't match / รหัสผ่านไม่ตรงกัน"
                            : "Password Matched / รหัสผ่านตรงกัน",
                        style: TextStyle(fontSize: 12))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 22, right: 20, top: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        hintText: 'Tel / เบอร์โทร',
                        contentPadding: EdgeInsets.only(left: 30)),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFFC3D162))),
                        hintText: 'Date of birth(DD/MM/YY) / วัน/เดือน/ปีเกิด',
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
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: Text('or Sign Up using'),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0)),
                            child: Image.asset('assets/images/line_login.png')),
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0)),
                            child: Image.asset(
                                'assets/images/facebook_login.png')),
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0)),
                            child:
                                Image.asset('assets/images/google_login.png')),
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Colors.white),
                            child:
                                Image.asset('assets/images/apple_login.png')),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _emailErrorMessage = "Email can't be empty";
      });
    } else if (!EmailValidator.validate(val, false)) {
      setState(() {
        _emailErrorMessage = "Invalid Email";
      });
    } else {
      setState(() {
        _emailErrorMessage = "";
      });
    }
  }

  void checkPassword(String password) {
    setState(
      () {
        RegExp numberRegex = RegExp(r'^.*[0-9].*$');
        RegExp usableRegex =
            RegExp(r'[a-zA-Z0-9~`!@#$%^&*(\)_+={[}\]|:;"<,>.?-]$');
        RegExp capitalRegex = RegExp(r'^.*[A-Z].*$');

        _confirmPass = password;
        _isPasswordLen = false;

        if (password.length >= 8) {
          _isPasswordLen = true;
        }

        _isPasswordUsable = false;
        if (password.isEmpty) {
          _isPasswordUsable = false;
        } else if (password.isNotEmpty && usableRegex.hasMatch(password)) {
          _isPasswordUsable = true;
        }

        _isPasswordNumber = false;
        if (numberRegex.hasMatch(password)) {
          _isPasswordNumber = true;
        }

        _isPasswordCapital = false;
        if (capitalRegex.hasMatch(password)) {
          _isPasswordCapital = true;
        }
      },
    );
  }
}
