// import 'package:flutter/Material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:studentapp/model/data_model.dart';

// ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

// Future<void> addStudent(StudentModel value) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final _id = await studentDB.add(value);
//   value.id = _id;
//   await studentDB.put(value.id, value);
//   studentListNotifier.value.add(value);
//   studentListNotifier.notifyListeners();
// }

// Future<void> getAllStudents() async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   studentListNotifier.value.clear();

//   studentListNotifier.value.addAll(studentDB.values);
//   studentListNotifier.notifyListeners();
// }

// Future<void> deleteStudent(int id) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   await studentDB.delete(id);
//   studentListNotifier.notifyListeners();
//   getAllStudents();
// }

// Future<void> updatestudent(int id, StudentModel value) async {
//   final StudentDB = await Hive.openBox<StudentModel>('student_db');
//   await StudentDB.put(id, value);
//   await getAllStudents();
// }
