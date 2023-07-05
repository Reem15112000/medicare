import 'package:flutter/material.dart';

import '../../constant.dart';
import '../specialized.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "جميع العيادات",
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
              text: "عيادات التيسير ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات المباشر التخصصية",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات مدينة نصر",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات الزهراء التخصصية ",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات تراست التخصصية",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات ألترا كير",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات ابو امين الطبية",
            ),
            SizedBox(
              height: 10,
            ),
            ListTileWidget(
              onTap: () {},
              text: "عيادات اليسر الطبية",
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
