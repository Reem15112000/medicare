import 'package:flutter/material.dart';

import '../../constant.dart';
import '../specialized.dart';

class LaboratoryScreen extends StatefulWidget {
  const LaboratoryScreen({super.key});

  @override
  State<LaboratoryScreen> createState() => _LaboratoryScreenState();
}

class _LaboratoryScreenState extends State<LaboratoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "جميع المعامل",
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
              text: "كلينلاب",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "كير لاب ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "مركز التحاليل الطبية د ميشيل جورچ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "معامل الأنصارى",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "معامل الخبراء ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "معامل البحوث",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "معامل الرواد",
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
