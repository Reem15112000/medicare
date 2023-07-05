import 'package:flutter/material.dart';

import '../../constant.dart';
import '../specialized.dart';

class MedicalCenterScreen extends StatefulWidget {
  const MedicalCenterScreen({super.key});

  @override
  State<MedicalCenterScreen> createState() => _MedicalCenterScreenState();
}

class _MedicalCenterScreenState extends State<MedicalCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المراكز الطبية",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTileWidget(
              onTap: () {},
              text: "الخبيرى - مركز صحة الأسرة",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "المركز التخصصي للعلاج الطبيعي",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "المركز الدولي ل أمراض الكلي ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "المركز الدولي ل طب الأسنان",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "المركز الطبي للجمعية الشرعية",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "مركز طيبة سكوب ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "مركز عجيبي الطبي ",
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
