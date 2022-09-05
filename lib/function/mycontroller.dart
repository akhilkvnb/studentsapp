// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/model/data_model.dart';

class Mycontroller extends GetxController {
  Mycontroller() {
    getAllStudents();
  }
  List<StudentModel> student = <StudentModel>[];
  List<StudentModel> temp = [];
  String image = '';

  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final _id = await studentDB.add(value);
    value.id = _id;
    image = '';
    await studentDB.put(value.id, value);
    getAllStudents();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    student.clear();
    student.addAll(studentDB.values);
    update();
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.delete(id);
    //update();
    getAllStudents();
  }

  Future<void> updatestudent(int id, StudentModel value) async {
    final StudentDB = await Hive.openBox<StudentModel>('student_db');
    await StudentDB.put(id, value);
    await getAllStudents();
  }

  addimage() async {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickimage == null) {
      return;
    }
    update();
    final bytes = File(pickimage.path).readAsBytesSync();

    image = base64Encode(bytes);

    return image;
  }
}
