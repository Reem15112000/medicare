import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medicare_app/constant.dart';

import 'emailfield01.dart';
import 'emailfield02.dart';

class DoctorSignUpAccount extends StatelessWidget {
  const DoctorSignUpAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailField02(
          title: Text("اسم الطبيب"),
          titleStyle: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          leading: Icon(
            Icons.person,
            color: darkColor,
            weight: 20,
          ),
          backgroundColor: lightColor,
        ),
        SizedBox(
          height: 10,
        ),
        //----------------
        EmailField02(
          title: Text("تخصص الطبيب"),
          titleStyle: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          leading: Icon(
            Icons.work,
            color: darkColor,
            weight: 20,
          ),
          backgroundColor: lightColor,
        ),
        SizedBox(
          height: 10,
        ),
        EmailField02(
          title: Text("رقم الهاتف"),
          titleStyle: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          leading: Icon(
            Icons.phone,
            color: darkColor,
            weight: 20,
          ),
          tailing: Icon(Icons.remove_red_eye),
          backgroundColor: lightColor,
        ),
        SizedBox(
          height: 10,
        ),
        EmailField02(
          title: Text("البريد الالكتروني"),
          titleStyle: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          leading: Icon(
            Icons.email,
            color: darkColor,
            weight: 20,
          ),
          backgroundColor: lightColor,
        ),
        SizedBox(
          height: 10,
        ),
        EmailField02(
          title: Text("كلمة المرور"),
          titleStyle: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          leading: Icon(
            Icons.lock,
            color: darkColor,
            weight: 20,
          ),
          tailing: Icon(Icons.remove_red_eye),
          backgroundColor: lightColor,
        ),
        SizedBox(
          height: 10,
        ),
        EmailField02(
          title: Text("تأكيد كلمة المرور"),
          titleStyle: TextStyle(
            color: darkColor,
            fontWeight: FontWeight.w500,
          ),
          leading: Icon(
            Icons.lock,
            color: darkColor,
            weight: 20,
          ),
          tailing: Icon(Icons.remove_red_eye),
          backgroundColor: lightColor,
        ),
      ],
    );
  }
}
