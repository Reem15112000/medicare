import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/hospital_controller.dart';
import '../specialized.dart';

class Hospitals extends StatelessWidget {
  Hospitals({super.key});
  HospitalController controller = Get.put(HospitalController());
  Map<String, dynamic> data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "قم بإختيار المستشفى",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: controller.getHospital(data["hospital_type"]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTileWidget(
                            onTap: () {
                              Get.to(() => Specialized(), arguments: {
                                "hospital_id": snapshot.data![index].id,
                              });
                            },
                            text: "${snapshot.data![index].name}"),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: kDarkBlueColor,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

/*

ListTileWidget(
                onTap: () {
                  Get.to(() => Specialized());
                },
                text: "مستشفى الأمومة"),
            SizedBox(
              height: 10,
            ),

*/
