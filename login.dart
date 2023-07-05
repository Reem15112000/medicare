import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/constant.dart';
import 'package:medicare_app/controller/authentication_controller.dart';
import 'package:medicare_app/views/forgotPassword.dart';
import 'package:medicare_app/views/DoctorHomePage.dart';
import 'package:medicare_app/views/home_patient_screen.dart';
import 'package:medicare_app/views/mainpages/admin_page.dart';
import 'package:medicare_app/views/mainpages/profile.dart';
import 'package:medicare_app/views/register.dart';
import 'package:medicare_app/widgets/emailfield01.dart';
import 'package:medicare_app/widgets/emailfield02.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController logEmailPatientController = TextEditingController();

  TextEditingController logPasswordPatientController = TextEditingController();

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "تسجيل حسابك الحالي",
          style: TextStyle(color: kDarkBlueColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: kDarkBlueColor),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: Get.size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/loginlogo.png"),
                EmailField02(
                  title: Text("البريد الالكتروني"),
                  titleStyle: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: logEmailPatientController,
                  leading: Icon(
                    Icons.email_outlined,
                    color: kDarkBlueColor,
                  ),
                  backgroundColor: lightColor,
                ),
                SizedBox(
                  height: 20,
                ),
                EmailField02(
                  title: Text("كلمةالمرور"),
                  titleStyle: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w500,
                  ),
                  leading: Icon(
                    Icons.lock_outline,
                    color: kDarkBlueColor,
                    weight: 20,
                  ),
                  controller: logPasswordPatientController,
                  backgroundColor: lightColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: kDarkBlueColor,
                        ),
                        onPressed: () {
                          Get.to(
                            ForgotPassword(),
                          );
                        },
                        child: Text(
                          "هل نسيت كلمة المرور ؟",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: kDarkBlueColor,
                        ));
                      } else {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 30),
                            backgroundColor: kDarkBlueColor,
                          ),
                          onPressed: () async {
                            controller.patientLogin(
                                logEmailPatientController.text.trim(),
                                logPasswordPatientController.text.trim());
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(fontFamily: "Cairo", fontSize: 25),
                          ),
                        );
                      }
                    }),
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
                          foregroundColor: kDarkBlueColor,
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
      ),
    );
  }
}
