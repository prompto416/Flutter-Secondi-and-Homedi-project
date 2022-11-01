import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
  DateTime date = DateTime.now();
  TextEditingController dateinput = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: const BackButton(color: Color(0xFFC3D162)),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(children: [
          //login signup row
          // const SizedBox(
          //   height: 60,
          //   child: Text('LOGO'),
          // ),
          //username password box
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 7.5.w),
            child: TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  hintText: 'Username / ชื่อผู้ใช้',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  contentPadding: EdgeInsets.only(
                    left: 6.w,
                    top: 4.h,
                  )),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.5.w),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color(0xFFC3D162))),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color(0xFFC3D162))),
                hintText: 'Email / อีเมล',
                contentPadding: EdgeInsets.only(
                  left: 6.w,
                  top: 4.h,
                ),
                hintStyle: TextStyle(fontSize: 12.sp),
              ),
              onFieldSubmitted: (val) {
                validateEmail(val);
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Text(
                _emailErrorMessage,
                style: TextStyle(color: Colors.red, fontSize: 12.sp),
                textAlign: TextAlign.start,
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 7.5.w),
            child: TextFormField(
              onChanged: (password) => checkPassword(password),
              obscureText: _isVisible,
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  hintText: 'Password / รหัสผ่าน',
                  hintStyle: TextStyle(fontSize: 12.sp),
                  contentPadding: EdgeInsets.only(
                    left: 6.w,
                    top: 4.h,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: !_isVisible
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : const Icon(Icons.visibility_off,
                              color: Colors.grey))),
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordUsable ? Colors.green : Colors.white,
                    border: _isPasswordUsable
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                // ignore: unnecessary_string_escapes
                'A-Z, a-z , 0-9, or symbols ~`! @#\$%^&*()_-+={[}]|\\:;"\'<\,\>.?/',
                style: TextStyle(fontSize: 9.sp),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordLen ? Colors.green : Colors.white,
                    border: _isPasswordLen
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Contains at least 8 characters / ความยาวไม่น้อยกว่า 8 ตัวอักษร',
                style: TextStyle(fontSize: 9.sp),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordNumber ? Colors.green : Colors.white,
                    border: _isPasswordNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text('Contains at least 1 number / ตัวเลขไม่น้อยกว่า 1 ตัว',
                  style: TextStyle(fontSize: 9.sp))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordCapital ? Colors.green : Colors.white,
                    border: _isPasswordCapital
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                  'Contains at least 1 capital / ตัวพิมพ์ใหญ่ไม่น้อยกว่า 1 ตัว',
                  style: TextStyle(fontSize: 9.sp))
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.5.w),
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
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color(0xFFC3D162))),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color(0xFFC3D162))),
                hintText: 'Confirm Password / ยืนยันรหัสผ่าน',
                hintStyle: TextStyle(fontSize: 12.sp),
                contentPadding: EdgeInsets.only(
                  left: 6.w,
                  top: 4.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordMatched ? Colors.green : Colors.white,
                    border: _isPasswordMatched
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                  !_isPasswordMatched
                      ? "Password doesn't match / รหัสผ่านไม่ตรงกัน"
                      : "Password Matched / รหัสผ่านตรงกัน",
                  style: TextStyle(fontSize: 10.sp))
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.5.w),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color(0xFFC3D162))),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color(0xFFC3D162))),
                hintText: 'Tel / เบอร์โทร',
                hintStyle: TextStyle(fontSize: 12.sp),
                contentPadding: EdgeInsets.only(
                  left: 6.w,
                  top: 4.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.5.w),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: dateinput,
              style: TextStyle(fontSize: 12.sp),
              readOnly: true,
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 3, color: Color(0xFFC3D162))),
                  hintText: 'วัน/เดือน/ปีเกิด (DD/MM/YY)',
                  hintStyle: (TextStyle(fontSize: 12.sp)),
                  contentPadding: EdgeInsets.only(
                    left: 6.w,
                    top: 4.h,
                  ),
                  suffixIcon: const UnconstrainedBox(
                    child: Icon(
                      Icons.calendar_month,
                    ),
                  )),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    locale: const Locale('en', 'IN'),
                    fieldHintText: ('dd/mm/yyyy'),
                    initialDate: date,
                    firstDate: DateTime(
                        1920), //DateTime.now() - not to allow to choose before today.
                    lastDate: date);

                if (pickedDate != null) {
                  // print(
                  //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  // print(
                  //     formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  // print("Date is not selected");
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
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
                    borderRadius: BorderRadius.circular(30),
                  ))),
              child: Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          SizedBox(
            child: Text(
              'or Sign Up using',
              style: TextStyle(fontSize: 10.sp),
            ),
          ),
          SizedBox(
            height: 3.h,
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
        ]),
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
