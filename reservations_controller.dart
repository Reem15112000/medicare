import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/reservations/reservations_model/reservations_model.dart';
import 'authentication_controller.dart';

class ReservationsController extends GetxController {
  AuthController controller = Get.put(AuthController());

  //-----------------
  Future<void> makeReservation(int sectionId, String date) async {
    String url = "https://hospital-pink.vercel.app/api/my-reservations/";
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    var body = {"date": "${DateTime.now()}", "doctor": sectionId};
    var informations = jsonEncode(body);
    http.Response response =
        await http.post(Uri.parse(url), body: informations, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 201) {
      Get.snackbar("نجح", "تم تأكيد الحجز بنجاح",
          colorText: Colors.white, backgroundColor: Colors.green);
    } else if (response.statusCode == 400) {
      Get.snackbar("فشل", "تعذر تأكيد الحجز",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }
  //--------------------------------------------

  Future<List<ReservationsModel>?> getReservations() async {
    String url = "https://hospital-pink.vercel.app/api/my-reservations/";

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    String body = utf8.decode(response.bodyBytes);
    print(response.body);
    if (response.statusCode == 200) {
      // Parse the body of the response as a list of JSON objects
      List<dynamic> jsonResponse = jsonDecode(body);
      // For each JSON object, create a HospitalModel and add it to a list
      List<ReservationsModel> reservations =
          jsonResponse.map((item) => ReservationsModel.fromJson(item)).toList();
      return reservations;
    }
  }
}
