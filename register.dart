import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/controller/authentication_controller.dart';
import 'package:medicare_app/views/home_patient_screen.dart';
import 'package:medicare_app/views/login.dart';

import '../constant.dart';
import '../widgets/emailfield02.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ganderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "إنشاء حساب جديد",
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
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      EmailField02(
                        title: Text("اسم المريض"),
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "الرجاء إدخال الاسم";
                          }
                          return null;
                        },
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.person,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        title: Text("رقم هاتف المريض"),
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "الرجاء إدخال رقم الهاتف";
                          }
                          // Add additional validation rules as needed
                          return null;
                        },
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboradType: TextInputType.phone,
                        leading: Icon(
                          Icons.phone,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyDropdown(
                        onValueChanged: (newValue) {
                          ganderController.text = newValue;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        title: Text("البريد الالكتروني"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "الرجاء إدخال البريد الإلكتروني";
                          } else if (!value.contains('@')) {
                            return "بريد إلكتروني غير صالح";
                          }
                          return null;
                        },
                        controller: emailController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.email,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EmailField02(
                        validator: (value) {
                          if (value < 8) {
                            return "لا يجب أن يكون الباسورد أقل من 8 أحرف ورموز";
                          }
                        },
                        title: Text("كلمة المرور"),
                        controller: passwordController,
                        titleStyle: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                        leading: Icon(
                          Icons.lock,
                          color: kDarkBlueColor,
                          weight: 20,
                        ),
                        backgroundColor: lightColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
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
                            if (_formKey.currentState!.validate()) {
                              controller.createPatientAccount(
                                emailController.text,
                                nameController.text,
                                passwordController.text,
                                phoneNumberController.text,
                                ganderController.text,
                              );
                            }
                          },
                          child: Text(
                            "تسجيل حساب جديد",
                            style: TextStyle(fontFamily: "Cairo", fontSize: 23),
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
                        onPressed: () {},
                        child: Text(
                          "لدي حساب حالي",
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

class MyDropdown extends StatefulWidget {
  final Function(String) onValueChanged;

  MyDropdown({required this.onValueChanged});
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xffdddbf3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedValue,
          hint: Text("النوع"),
          icon: Icon(Icons.arrow_drop_down),
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            widget.onValueChanged(newValue!);
          },
          items: <String>['ذكر', 'أنثى']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
/*
EmailField02(
                title: Text("Name"),
                titleStyle: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.w500,
                ),
                leading: Icon(
                  Icons.person_outline,
                  color: darkColor,
                  weight: 20,
                ),
                backgroundColor: lightColor,
              ),
              SizedBox(
                height: 20,
              ),
              EmailField02(
                title: Text("Email Address"),
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
                height: 20,
              ),
              EmailField02(
                title: Text("Password"),
                titleStyle: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.w500,
                ),
                leading: Icon(
                  Icons.lock_outline,
                  color: darkColor,
                  weight: 20,
                ),
                backgroundColor: lightColor,
              ),





*/
