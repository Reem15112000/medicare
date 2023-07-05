import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/constant.dart';
import 'package:medicare_app/views/mainpages/hospitals.dart';
import 'package:medicare_app/views/specialized.dart';

class HospitalType extends StatelessWidget {
  HospitalType({super.key});
  var hospitalType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "قم بإختيار نوع المستشفى",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTileWidget(
              onTap: () {
                Get.to(() => Hospitals(), arguments: {
                  "hospital_type": "public",
                });
              },
              text: "مستشفى عامة"),
          SizedBox(
            height: 10,
          ),
          ListTileWidget(
              onTap: () {
                hospitalType = "public";
                Get.to(() => Hospitals(), arguments: {
                  "hospital_type": "private",
                });
              },
              text: "مستشفى خاصة"),
        ],
      ),
    );
  }
}
