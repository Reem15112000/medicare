import 'package:get/get.dart';
import 'package:medicare_app/controller/authentication_controller.dart';
import 'dart:convert';
import '../Model/doctors model/doctors_model/doctors_model.dart';
import 'package:http/http.dart' as http;

class DoctorsController extends GetxController {
  AuthController controller = Get.put(AuthController());

//--------------
  Future<List<DoctorsModel>?> getDoctors(
      {required int hospital_id, required int section_id}) async {
    String url =
        "https://hospital-pink.vercel.app/api/doctors/?section__id=$section_id&section__hospital__id=$hospital_id";

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
      List<DoctorsModel> hospitals =
          jsonResponse.map((item) => DoctorsModel.fromJson(item)).toList();
      return hospitals;
    }
  }
}
