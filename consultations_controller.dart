import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicare_app/views/home_patient_screen.dart';
import '../Model/consultations model/consultations_model/consultations_model.dart';
import 'authentication_controller.dart';

class ConsultationController extends GetxController {
  AuthController controller = Get.put(AuthController());

  Future<void> createConsultations({
    required int sectionId,
    required String type,
    required int age,
    required int weight,
    required String description,
    required String hasAnyDisease,
  }) async {
    String url = "https://hospital-pink.vercel.app/api/my-consulations/";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    var body = {
      "type": type,
      "age": age,
      "weight": weight,
      "description": description,
      "section": sectionId,
      "has_any_disease": hasAnyDisease == "نعم" ? true : false,
    };
    var informations = jsonEncode(body);
    http.Response response =
        await http.post(Uri.parse(url), body: informations, headers: headers);
    print(response.statusCode);
    print("my token : ${controller.jwt}");
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      Get.snackbar("نجح", "تم إرسال الاستشارة بنجاح",
          colorText: Colors.white, backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.snackbar("فشل", "تعذر إرسال الاستشارة",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }
  //--------------------------------------------

  Future<List<ConsultationsModel>?> getConsultations() async {
    String url = "https://hospital-pink.vercel.app/api/my-consulations/";

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    String body = utf8.decode(response.bodyBytes);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // Parse the body of the response as a list of JSON objects
      List<dynamic> jsonResponse = jsonDecode(body);
      // For each JSON object, create a HospitalModel and add it to a list
      List<ConsultationsModel> reservations = jsonResponse
          .map((item) => ConsultationsModel.fromJson(item))
          .toList();
      return reservations;
    }
    update();
  }
}
