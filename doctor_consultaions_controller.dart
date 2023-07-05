import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicare_app/views/home_patient_screen.dart';
import '../Model/consultations model/consultations_model/consultations_model.dart';
import 'authentication_controller.dart';

class DoctorConsultationController extends GetxController {
  AuthController controller = Get.put(AuthController());
  var consultationLength;
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
      List<ConsultationsModel> consultation = jsonResponse
          .map((item) => ConsultationsModel.fromJson(item))
          .toList();
      consultationLength = consultation.length;
      return consultation;
    }
    update();
  }

  //---------------------------------------------
  Future<void> replyConsultations(
      {required String reply, required int consultationId}) async {
    String url =
        "https://hospital-pink.vercel.app/api/my-consulations/$consultationId/";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    var body = {"reply": reply};
    var informations = jsonEncode(body);
    http.Response response =
        await http.patch(Uri.parse(url), body: informations, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200) {
      Get.snackbar("نجح", "تم الرد على الاستشارة بنجاح",
          colorText: Colors.white, backgroundColor: Colors.green);
          
    } else if (response.statusCode == 400) {
      Get.snackbar("فشل", "تعذر الرد على الاستشارة",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }
}
