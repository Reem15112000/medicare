import 'dart:convert';

import 'package:get/get.dart';

import '../Model/emergency_model.dart';
import 'package:http/http.dart' as http;

class EmergencyController extends GetxController {
  Future<EmergencyModel> getDoctors() async {
    String url =
        "https://cloud.appwrite.io/v1/databases/6425a0ee1f0df0551b6d/collections/642625c204e5883cd666/documents";

    var header = {
      "Content-Type": "application/json",
      "X-Appwrite-Project": "6425a0c72e7d63bb50c8",
      "X-Appwrite-Key":
          "12955eac217643e9f043f8286521c5fc6939aaab26a2b69633cc4266d8201cb32b9bd6571541b0929962fa330abab2e7f88035aa27abc3599719857a21ef2f7e172c34c2d8ec5b9c2dd90e43ff3353bcafb16c654d7a320fc17f7de1ee97a3a87ed26891e2f2bac8897efeb197a1dd598b989378435f29f9b4700ba1d1658d16"
    };

    http.Response response = await http.get(Uri.parse(url), headers: header);

    if (response.statusCode == 200) {
      return EmergencyModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("faled");
  }
}
