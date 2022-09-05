import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/function/mycontroller.dart';
import 'package:studentapp/model/data_model.dart';

class ScreenEdit extends StatelessWidget {
  final String name;
  final String age;
  final String place;
  int? id;
  final String? image;

  Mycontroller editcontroller = Get.find();

  ScreenEdit(
      {Key? key,
      required this.name,
      required this.age,
      required this.place,
      required this.id,
      required this.image})
      : super(key: key);
  final nameUpdateController = TextEditingController();
  final ageUpdateController = TextEditingController();
  final placeUpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameUpdateController.text = name;
    ageUpdateController.text = age;
    placeUpdateController.text = place;
    return Scaffold(
      body: editpage(),
    );
  }

  editpage() {
    return Center(
      child: Container(
        color: Colors.white,
        height: 500,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              CircleAvatar(
                maxRadius: 70,
                backgroundImage: MemoryImage(
                    const Base64Decoder().convert(image.toString())),
              ),
              const Text('name:'),
              TextField(
                controller: nameUpdateController,
                decoration: const InputDecoration(),
              ),
              const Text('age:'),
              TextField(
                controller: ageUpdateController,
                decoration: const InputDecoration(),
              ),
              const Text('place:'),
              TextField(
                controller: placeUpdateController,
                decoration: const InputDecoration(),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    studentupdate();
                  },
                  child: const Text('update'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> studentupdate() async {
    final name = nameUpdateController.text;
    final age = ageUpdateController.text;
    final place = placeUpdateController.text;
    if (name.isEmpty || age.isEmpty || place.isEmpty) {
      return;
    }
    final studentupvalues =
        StudentModel(name: name, age: age, place: place, id: id, image: image);

    editcontroller.updatestudent(id!, studentupvalues);
  }
}
