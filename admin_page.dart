import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../widgets/emailfield02.dart';

class Doctor {
  String name;
  String email;
  String specialization;

  Doctor(
      {required this.name, required this.email, required this.specialization});
}

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Doctor> doctors = [];

  Widget _buildDoctorList() {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(doctors[index].name),
          subtitle: Text(doctors[index].specialization),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                doctors.removeAt(index);
              });
            },
          ),
          onTap: () async {
            final updatedDoctor = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorForm(doctor: doctors[index]),
              ),
            );
            if (updatedDoctor != null) {
              setState(() {
                doctors[index] = updatedDoctor;
              });
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: _buildDoctorList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newDoctor = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorForm(),
            ),
          );
          if (newDoctor != null) {
            setState(() {
              doctors.add(newDoctor);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DoctorForm extends StatefulWidget {
  final Doctor? doctor;

  DoctorForm({this.doctor});

  @override
  _DoctorFormState createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _specializationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.doctor != null) {
      _nameController.text = widget.doctor!.name;
      _emailController.text = widget.doctor!.email;
      _specializationController.text = widget.doctor!.specialization;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor == null ? 'Add Doctor' : 'Edit Doctor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            EmailField02(
              title: Text("اسم الطبيب"),
              titleStyle: TextStyle(
                color: kDarkBlueColor,
                fontWeight: FontWeight.w500,
              ),
              leading: Icon(
                Icons.person,
                color: kDarkBlueColor,
                weight: 20,
              ),
              controller: _nameController,
              backgroundColor: lightColor,
            ),
            SizedBox(
              height: 10,
            ),
            EmailField02(
              title: Text("الإيميل"),
              titleStyle: TextStyle(
                color: kDarkBlueColor,
                fontWeight: FontWeight.w500,
              ),
              leading: Icon(
                Icons.email,
                color: kDarkBlueColor,
                weight: 20,
              ),
              controller: _emailController,
              backgroundColor: lightColor,
            ),
            SizedBox(
              height: 10,
            ),
            EmailField02(
              title: Text("التخصص"),
              titleStyle: TextStyle(
                color: kDarkBlueColor,
                fontWeight: FontWeight.w500,
              ),
              leading: Icon(
                Icons.work,
                color: kDarkBlueColor,
                weight: 20,
              ),
              controller: _specializationController,
              backgroundColor: lightColor,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _specializationController.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Doctor(
                      name: _nameController.text,
                      email: _emailController.text,
                      specialization: _specializationController.text,
                    ),
                  );
                }
              },
              child:
                  Text(widget.doctor == null ? 'Add Doctor' : 'Update Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}

//--------------
