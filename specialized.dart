import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../controller/emergency_controller.dart';
import '../controller/hospital_controller.dart';
import 'Sections_screens/doctors.dart';

class Specialized extends StatelessWidget {
  Specialized({super.key});

  Map<String, dynamic> data = Get.arguments;
  HospitalController controller = Get.put(HospitalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          "الأقسام",
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
            future: controller.getSections(data["hospital_id"]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTileWidget(
                            onTap: () {
                              Get.to(DoctorsScreen(), arguments: {
                                "hospital_id": data["hospital_id"],
                                "section_id": snapshot.data![index].id
                              });
                            },
                            text: "${snapshot.data![index].name}"),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                );
              } else {
                return CircularProgressIndicator(
                  color: kDarkBlueColor,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: Colors.black),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      trailing: Icon(
        Icons.arrow_right_sharp,
        color: Colors.black,
      ),
    );
  }
}

/*


ListTileWidget(
                onTap: () {
                  controller.getDoctors();
                  Get.to(EmergancyScreen());
                },
                text: "قسم الطوارئ"),
            SizedBox(
              height: 10,
            ),
*/
