import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/views/home_patient_screen.dart';
import 'package:medicare_app/widgets/doctor_sign_up_account.dart';

import '../constant.dart';
import '../views/DoctorHomePage.dart';
import '../widgets/patient_sign_up_account.dart';
import 'package:appwrite/appwrite.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;
  var jwt = "";
  var userName = "";

  Future<void> createPatientAccount(String email, String name, String password,
      String phone, String gander) async {
    isLoading.value = true;
    String url = "https://hospital-pink.vercel.app/api/register/";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "$jwt",
    };
    var body = {
      "first_name": name,
      "phone": phone,
      "gender": gander,
      "email": email,
      "password": password
    };
    var informations = jsonEncode(body);
    http.Response response =
        await http.post(Uri.parse(url), body: informations, headers: headers);

    if (response.statusCode == 201) {
      parseAndSaveAccessAndName(response.body);
      Get.to(() => HomePatientScreen());
    } else if (response.statusCode == 400) {
      Get.snackbar("خطأ", "هناك حقول فارغة",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    isLoading.value = false;
    update();
  }

  void parseAndSaveAccessAndName(String responseBody) {
    Map<String, dynamic> responseMap = jsonDecode(responseBody);
    String accessValue = responseMap['access'];
    String userPatientName = responseMap['first_name'];
    jwt = accessValue;
    userName = userPatientName;
    print("our jwt is $jwt");
  }

  Future<void> patientLogin(String email, String password) async {
    isLoading.value = true;
    String url = "https://hospital-pink.vercel.app/api/login/";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "$jwt",
    };
    var body = {"username": email, "password": password};
    var informations = jsonEncode(body);
    http.Response response =
        await http.post(Uri.parse(url), body: informations, headers: headers);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      parseAndSaveAccess(response.body);
      if (jsonDecode(response.body)['role'] == "patient") {
        Get.to(() => HomePatientScreen());
      } else if (jsonDecode(response.body)['role'] == "doctor") {
        Get.to(() => DoctorHomePage());
        print("our jwt == $jwt");
      }
    } else if (response.statusCode == 400) {
      Get.snackbar("خطأ", "هناك حقول فارغة",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    isLoading.value = false;
    update();
  }

  void parseAndSaveAccess(String responseBody) {
    Map<String, dynamic> responseMap = jsonDecode(responseBody);
    String accessValue = responseMap['access'];
    jwt = accessValue;
    print("our jwt is $jwt");
  }

  //---------------
}
