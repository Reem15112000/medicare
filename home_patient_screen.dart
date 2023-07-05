import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/controller/authentication_controller.dart';
import 'package:medicare_app/views/login.dart';
import 'package:medicare_app/views/mainpages/clinic.dart';
import 'package:medicare_app/views/mainpages/type_hospital.dart';

import '../Model/consultations model/consultations_model/consultations_model.dart';
import '../constant.dart';
import '../controller/consultations_controller.dart';
import '../controller/reservations_controller.dart';
import 'mainpages/add_consultation.dart';
import 'mainpages/hospitals.dart';
import 'mainpages/laboratory_screens.dart';
import 'mainpages/medical_center.dart';
import 'mainpages/profile.dart';
import 'specialized.dart';

class HomePatientScreen extends StatelessWidget {
  HomePatientScreen({super.key});
  AuthController controller = Get.put(AuthController());
  ReservationsController controllerReserv = Get.put(ReservationsController());
  ConsultationController controllerConsultations =
      Get.put(ConsultationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "مرحباً",
          style: TextStyle(color: kDarkBlueColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.defaultDialog(
                content: ListTileWidget(
                    onTap: () {
                      Get.off(() => Login());
                    },
                    text: "تسجيل الخروج"),
                title: "");
          },
          child: Icon(
            Icons.menu_sharp,
            color: kDarkBlueColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "محتاج دكتور شاطر ؟",
                        style: TextStyle(
                          color: kDarkBlueColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              content: Container(
                                height: 270, // Increased from 200 to 300.
                                child: Column(
                                  children: [
                                    ListTileWidget(
                                      onTap: () {
                                        Get.to(() => HospitalType());
                                      },
                                      text: "مستشفى",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTileWidget(
                                        onTap: () {
                                          Get.to(() => ClinicScreen());
                                        },
                                        text: "عيادة"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTileWidget(
                                      onTap: () {
                                        Get.to(() => MedicalCenterScreen());
                                      },
                                      text: "مراكز طبية",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTileWidget(
                                        onTap: () {
                                          Get.to(() => LaboratoryScreen());
                                        },
                                        text: "معامل"),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 10,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/catigories.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //-------------------
                  InkWell(
                    onTap: () => Get.defaultDialog(
                      title: "أرقام التواصل",
                      content: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: ListTile(
                              leading: Icon(Icons.phone),
                              title: Text(
                                "مستشفى الأمومة",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text("0472552112"),
                            ),
                          ),
                          //---------------------
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: ListTile(
                              title: Text(
                                "مستشفى عين شمس",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: Icon(Icons.phone),
                              trailing: Text("24020283"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Card(
                        elevation: 10,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/support.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //-------------------
                ],
              ),
              Row(
                children: [
                  Text(
                    "إضافة استشارة",
                    style: TextStyle(color: kDarkBlueColor, fontSize: 25),
                  )
                ],
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Card(
                    elevation: 10,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "قم بإضافة استشارة",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(AddConsultation());
                            },
                            icon: Icon(
                              Icons.add,
                              size: 50,
                              color: kDarkBlueColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "الإستشارات المرسلة",
                    style: TextStyle(color: kDarkBlueColor, fontSize: 25),
                  )
                ],
              ),
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
                          return Text("No data");
                        }
                      }),
                ),
              ),
              /*
                            Center(
                child: GetBuilder<ConsultationController>(
                  builder: (controllerConsultations) => FutureBuilder(
                    future: controllerConsultations.getConsultations(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
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
                                        Text("${snapshot.data![index].type}"),
                                        Text(
                                            "${snapshot.data![index].description}")
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_sharp,
                                size: 100,
                                color: kDarkBlueColor,
                              ),
                              Text("عفوا, لا توجد استشارات مرسلة ")
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              */
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "الحجوزات القادمة",
                    style: TextStyle(color: kDarkBlueColor, fontSize: 25),
                  )
                ],
              ),
              Center(
                child: GetBuilder<ReservationsController>(
                  builder: (controllerReserv) => FutureBuilder(
                    future: controllerReserv.getReservations(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
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
                                            Text("الإسم :"),
                                            Text(
                                                "${snapshot.data![index].patient?.firstName}"),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("التاريخ :"),
                                            Text(
                                                "${snapshot.data![index].date}"),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("النوع :"),
                                            Text(
                                                "${snapshot.data![index].patient!.gender}"),
                                          ],
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("رقم الهاتف :"),
                                            Text(
                                                "${snapshot.data![index].patient!.phone}"),
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
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_sharp,
                                size: 100,
                                color: kDarkBlueColor,
                              ),
                              Text("عفوا, لا توجد أي حجوزات حالية "),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------

/*



*/
