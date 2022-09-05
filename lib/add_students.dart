// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:studentapp/function/mycontroller.dart';
// import 'package:studentapp/home.dart';
// import 'package:studentapp/model/data_model.dart';

// class AddStudent extends StatefulWidget {
//   const AddStudent({Key? key}) : super(key: key);

//   @override
//   State<AddStudent> createState() => _AddStudentState();
// }

// final _nameController = TextEditingController();

// final _ageController = TextEditingController();

// final _placeController = TextEditingController();

// class _AddStudentState extends State<AddStudent> {
//   String image = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blue),
//       body: getbody(),
//     );
//   }

//   getbody() {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.only(
//           top: 20,
//           left: 30,
//           right: 30,
//         ),
//         child: ListView(
//           children: [
//             const Center(
//               child: Text(
//                 'Students Details',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextFormField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Name',
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _ageController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Age',
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: _placeController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Place',
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 60, right: 60),
//               child: image.isNotEmpty
//                   ? CircleAvatar(
//                       maxRadius: 70,
//                       backgroundImage:
//                           MemoryImage(const Base64Decoder().convert(image)),
//                     )
//                   : CircleAvatar(
//                       maxRadius: 70,
//                       // height: 160,
//                       // width: 40,
//                       backgroundColor: Colors.grey,
//                       child: Center(
//                         child: IconButton(
//                           onPressed: () {
//                             addimage();
//                           },
//                           icon: const Icon(
//                             Icons.person,
//                             size: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                       )),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 60,
//                 right: 60,
//               ),
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   AddstudentsButton();
//                 },
//                 icon: const Icon(Icons.add),
//                 label: const Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> AddstudentsButton() async {
//     Mycontroller controller = Get.find();
//     final _name = _nameController.text;
//     final _age = _ageController.text;
//     final _place = _placeController.text;

//     if (_name.isEmpty || _age.isEmpty || _place.isEmpty) {
//       return;
//     }

//     final _student = StudentModel(
//       name: _name,
//       age: _age,
//       place: _place,
//       image: image,
//     );
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (ctx) => const ScreenHome()));
//     await controller.addStudent(_student);
//     _nameController.clear();
//     _ageController.clear();
//     _placeController.clear();
//   }

//   addimage() async {
//     final pickimage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickimage == null) {
//       return;
//     }
//     final bytes = File(pickimage.path).readAsBytesSync();
//     setState(() {
//       image = base64Encode(bytes);
//     });

//     return image;
//   }
// }
