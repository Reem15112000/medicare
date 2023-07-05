import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medicare_app/widgets/emailfield01.dart';
import '../../constant.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../controller/consultations_controller.dart';
import '../../controller/hospital_controller.dart';

class AddConsultation extends StatefulWidget {
  AddConsultation({super.key});

  @override
  State<AddConsultation> createState() => _AddConsultationState();
}

class _AddConsultationState extends State<AddConsultation> {
  var sectionName = "اختر التخصص";
  var type = "عادية";
  var sectionId;
  var hasAnyDisease = "لا";
  HospitalController controller = Get.put(HospitalController());
  ConsultationController consultationController =
      Get.put(ConsultationController());
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "أرسل استشارة",
          style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "نوع الاستشارة",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkColor),
              ),
              DropdownSearch<String>(
                items: ["عادية", "مستعجلة"],
                onChanged: (value) {
                  type = value!;
                },
                autoValidateMode: AutovalidateMode.always,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.justify,
                  baseStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                selectedItem: "عادية",
              ),
              //----------------------------
              Text(
                "التخصص",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: TextButton(
                    child: Row(
                      children: [
                        Text(
                          "$sectionName",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showMyBottomSheet(context);
                    }),
              ),

              //----------------------

              //----------------------
              Text(
                "السن",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              EmailField01(
                leading: Icon(Icons.man),
                title: Text("مثال : 31"),
                keyboradType: TextInputType.phone,
                fieldController: ageController,
              ),
              Text(
                "الوزن",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              EmailField01(
                fieldController: weightController,
                leading: Icon(Icons.monitor_weight),
                title: Text("اكتب وزنك: بوجدة الكيلوجرام"),
                keyboradType: TextInputType.phone,
              ),
              Text(
                "هل تعاني من اي أمراض ؟",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              DropdownSearch<String>(
                items: ["نعم", "لا"],
                onChanged: (value) {
                  hasAnyDisease = value!;
                },
                autoValidateMode: AutovalidateMode.always,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  textAlign: TextAlign.justify,
                  baseStyle: TextStyle(
                    fontSize: 22,
                  ),
                ),
                selectedItem: "لا",
              ),
              Text(
                "قم بوصف حالتك بدقة",
                style: TextStyle(fontSize: 18, color: darkColor),
              ),
              TextFormField(
                maxLength: 500,
                maxLines: 6,
                minLines: 5,
                controller: discriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), fillColor: darkColor),
              ),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      print(type);
                      print(hasAnyDisease);
                      print(sectionId);

                      consultationController.createConsultations(
                        sectionId: sectionId,
                        type: type,
                        age: int.parse(ageController.text),
                        weight: int.parse(weightController.text),
                        description: discriptionController.text,
                        hasAnyDisease: hasAnyDisease,
                      );
                    },
                    child: Text(
                      "ارسال الاستشارة",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: controller.getAllSections(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kDarkBlueColor,
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kDarkBlueColor),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            sectionName = "${snapshot.data![index].name}";
                            sectionId = snapshot.data![index].id!;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              "${snapshot.data![index].name}",
                              style: TextStyle(color: kDarkBlueColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('No data available');
              }
            },
          ),
        );
      },
    );
  }
}
