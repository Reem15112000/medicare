import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:medicare_app/constant.dart';
import 'package:medicare_app/views/login.dart';
import 'package:medicare_app/views/splash.dart';
import 'package:get/get.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'views/register.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Cairo",
        iconTheme: IconThemeData(
          color: Colors.amber,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHome(),
      locale: Locale.fromSubtags(languageCode: 'ar'),
    ),
  );
}

class MyHome extends StatelessWidget {
  final Color kDarkBlueColor = Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'تسجيل حساب',
      onFinish: () {
        Get.to(Register());
      },
      finishButtonColor: kDarkBlueColor,
      skipTextButton: Text(
        'تخطي',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        'تسجيل دخول',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Get.to(Login());
      },
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/images/pic1.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/pic2.png',
          height: 400,
        ),
        Container(
          height: 400,
          width: 400,
          child: Image.asset(
            'assets/images/pic3.png',
            height: 400,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'صحتك فجيبك...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'يمكن الوصول إلى ملفك الطبي مع جميع التقارير الطبية وتأمينهم في جيبك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'تواصل معنا بسهولة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'يمكنك حجز موعد مع أي طبيب في أي مستشفى بضغطة واحدة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'مشاركة بياناتك الطبية',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'يمكنك الوصول إلى بياناتك الطبية ومشاركتها بطريقة آمنة في أي مكان وفي أي وقت',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
