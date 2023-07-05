import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/views/register.dart';

import '../constant.dart';
import '../widgets/emailfield02.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'إعادة تعيين كلمة المرور',
          style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: darkColor),
      ),
      body: Center(
        child: Container(
          width: Get.size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/forgotPassword.png"),
              EmailField02(
                title: Text("البريد الالكتروني"),
                titleStyle: TextStyle(
                  color: Color(0xFF6e64e1),
                  fontWeight: FontWeight.w500,
                ),
                leading: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF6e64e1),
                ),
                backgroundColor: lightColor,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Get.size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: darkColor,
                      padding: EdgeInsets.symmetric(
                        vertical: v_btn_padding,
                      )),
                  onPressed: () {},
                  child: Text(
                    "نسيت كلمة المرور".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: darkColor,
                      ),
                      onPressed: () {
                        Get.to(
                          Register(),
                        );
                      },
                      child: Text(
                        "لا أملك حساب حالي",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
