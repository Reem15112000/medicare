import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_app/controller/doctor_consultaions_controller.dart';
import 'package:medicare_app/views/mainpages/profile.dart';

import '../Model/consultations model/consultations_model/consultations_model.dart';
import '../constant.dart';

class DoctorHomePage extends StatelessWidget {
  DoctorHomePage({super.key});

  DoctorConsultationController controller =
      Get.put(DoctorConsultationController());
  TextEditingController replyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: Text(
            "مرحباً",
            style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: bgColor,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.to(ProfilePage());
            },
            child: Image.asset("assets/images/profilelogo.png"),
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/images/bkcases.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "عدد الاستشارات",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          GetBuilder<DoctorConsultationController>(
                              init: DoctorConsultationController(),
                              builder: (controller) {
                                return Text(
                                  "${controller.consultationLength}",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "آخر الحالات",
                      style: TextStyle(fontSize: 25, color: darkColor),
                    ),
                    Image.asset("assets/images/latestcases.png")
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: GetBuilder<DoctorConsultationController>(
                    init: DoctorConsultationController(),
                    builder: (controller) => FutureBuilder(
                        future: controller.getConsultations(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator(); // return a loading spinner while waiting
                          } else if (snapshot.hasError) {
                            return Text(
                                "Error: ${snapshot.error}"); // if there's an error, display it
                          } else if (snapshot.hasData) {
                            // When data is ready, return a ListView.builder
                            List<ConsultationsModel>? data = snapshot.data;
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                        confirm: TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "إلغاء",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red),
                                            )),
                                        cancel: TextButton(
                                            onPressed: () {
                                              controller.replyConsultations(
                                                  reply: replyController.text,
                                                  consultationId: snapshot
                                                      .data![index].id!);
                                              Get.back();
                                              replyController.text = "";
                                            },
                                            child: Text(
                                              "إرسال الرد",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                        title: "الرد على الاستشارة",
                                        content: TextField(
                                          maxLines: 20,
                                          minLines: 5,
                                          controller: replyController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        // ignore: sort_child_properties_last
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("نوع الاستشارة:"),
                                                  Text(
                                                      "${snapshot.data![index].type}"),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("التاريخ :"),
                                                  Text(
                                                      "${snapshot.data![index].createdAt}"),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("السن"),
                                                  Text(
                                                      "${snapshot.data![index].age}"),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("الوزن"),
                                                  Text(
                                                      "${snapshot.data![index].weight}"),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("هل يعاني من أي أمراض"),
                                                  Text(
                                                      "${snapshot.data![index].hasAnyDisease == "true" ? "نعم" : "لا"}"),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("تفاصيل الحالة"),
                                                  Text(
                                                      "${snapshot.data![index].description}"),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("رد الطبيب:"),
                                                  Text(
                                                      "${snapshot.data![index].reply ?? "لم يتم الرد"}"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: kDarkBlueColor, width: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: Image.asset(
                                  "assets/images/notfoundcases.png"),
                            );
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "اضغط على كل استشارة ليتم الرد عليها",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

 Center(
                child: GetBuilder<ConsultationController>(
                  init: ConsultationController(),
                  builder: (controller) => FutureBuilder(
                      future: controller.getConsultations(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // return a loading spinner while waiting
                        } else if (snapshot.hasError) {
                          return Text(
                              "Error: ${snapshot.error}"); // if there's an error, display it
                        } else if (snapshot.hasData) {
                          // When data is ready, return a ListView.builder
                          List<ConsultationsModel>? data = snapshot.data;
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    // ignore: sort_child_properties_last
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("نوع الاستشارة:"),
                                              Text(
                                                  "${snapshot.data![index].type}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("التاريخ :"),
                                              Text(
                                                  "${snapshot.data![index].createdAt}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("التخصص:"),
                                              Text(
                                                  "${snapshot.data![index].sectionDetails!.name}"),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("رد الطبيب:"),
                                              Text(
                                                  "${snapshot.data![index].reply ?? "لم يتم الرد"}"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: kDarkBlueColor, width: 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(
                child: Image.asset("assets/images/notfoundcases.png"),
              );
                        }
                      }),
                ),
              ),

*/