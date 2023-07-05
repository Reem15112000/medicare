import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/hospital model/hospital_model/hospital_model.dart';
import '../Model/sections model/sections_model/sections_model.dart';
import 'authentication_controller.dart';

class HospitalController extends GetxController {
  AuthController controller = Get.put(AuthController());
  Future<List<HospitalModel>?> getHospital(String type) async {
    String url = "https://hospital-pink.vercel.app/api/hospitals/?type=$type";

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
      List<HospitalModel> hospitals =
          jsonResponse.map((item) => HospitalModel.fromJson(item)).toList();
      return hospitals;
    }
  }

  //---------------------------
  Future<List<SectionsModel>?> getSections(int hospitalId) async {
    String url =
        "https://hospital-pink.vercel.app/api/sections/?hospital__id=$hospitalId";

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    String body = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      // Parse the body of the response as a list of JSON objects
      List<dynamic> jsonResponse = jsonDecode(body);
      // For each JSON object, create a HospitalModel and add it to a list
      List<SectionsModel> sections =
          jsonResponse.map((item) => SectionsModel.fromJson(item)).toList();
      return sections;
    }
  }

  //----------------
  Future<List<SectionsModel>?> getAllSections() async {
    String url = "https://hospital-pink.vercel.app/api/sections/";

    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${controller.jwt}",
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    String body = utf8.decode(response.bodyBytes);
    print(controller.jwt);
    if (response.statusCode == 200) {
      // Parse the body of the response as a list of JSON objects
      List<dynamic> jsonResponse = jsonDecode(body);
      // For each JSON object, create a HospitalModel and add it to a list
      List<SectionsModel> sections =
          jsonResponse.map((item) => SectionsModel.fromJson(item)).toList();
      return sections;
    }
  }
}
