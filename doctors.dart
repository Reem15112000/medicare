import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/constant.dart';

import '../../Model/emergency_model.dart';
import '../../controller/doctors_controller.dart';
import '../../controller/emergency_controller.dart';
import '../../controller/reservations_controller.dart';

class DoctorsScreen extends StatefulWidget {
  DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  DoctorsController controller = Get.put(DoctorsController());
  ReservationsController controllerDoctor = Get.put(ReservationsController());
  Map<String, dynamic> data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: controller.getDoctors(
                section_id: data["section_id"],
                hospital_id: data["hospital_id"]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      color: Colors.white,
                      child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_rounded,
                                    color: kDarkBlueColor,
                                    size: 55,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].doctorName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: kDarkBlueColor,
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data![index].doctorDescription ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "الكشف بأسبقية الحضور للعيادة",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Divider(),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.hourglass_bottom,
                                          color: kDarkBlueColor,
                                          size: 50,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "مدة الانتظار",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              "30 دقيقة",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //-------------
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.monetization_on,
                                              color: kDarkBlueColor,
                                              size: 50,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "سعر الكشف",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                                Text(
                                                  "${snapshot.data![index].doctorPrice ?? ""} جنية",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kDarkBlueColor),
                                  ),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "تنبيه !",
                                      content: Text(
                                        "هل تريد التأكيد على الحجز عند\n ${snapshot.data![index].doctorName}؟ ",
                                        textAlign: TextAlign.center,
                                      ),
                                      confirm: TextButton(
                                        onPressed: () {
                                          controllerDoctor.makeReservation(
                                              data["section_id"],
                                              snapshot.data![index].fromTime!);
                                          Get.back();
                                        },
                                        child: Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.green),
                                          child: Center(
                                            child: Text(
                                              "تأكيد",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      cancel: TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "إلغاء",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 20),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "احجز اليوم (${snapshot.data![index].fromTime}-${snapshot.data![index].toTime})",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        width: double.infinity,
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
