// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/detaits.dart';
import 'package:studentapp/function/mycontroller.dart';
import 'package:studentapp/model/data_model.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  get studentDetails_Screen => null;

  @override
  Widget build(BuildContext context) {
    Mycontroller controller = Get.put(Mycontroller());

    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onTap: () {},
            onChanged: (String? value) {
              if (value == null || value.isEmpty) {
                controller.temp.addAll(controller.student);
                controller.update();
              } else {
                controller.temp.clear();
                for (StudentModel i in controller.student) {
                  if (i.name.toLowerCase().contains(value.toLowerCase())) {
                    controller.temp.add(i);
                  }
                  controller.update();
                }
              }
            },
            controller: searchController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'search'),
          ),
        ),
      ),
      body: SafeArea(child: GetBuilder<Mycontroller>(builder: (controller) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = controller.temp[index];
              return ListTile(
                title: Text(data.name),
                onTap: () {
                  Get.to(Screen_details(
                    name: data.name,
                    age: data.age,
                    place: data.place,
                    image: data.image,
                  ));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (ctx) => Screen_details(
                  //     name: data.name,
                  //     age: data.age,
                  //     place: data.place,
                  //     image: data.image,
                  //   ),
                  // )
                  // );
                },
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: controller.temp.length);
      })),
    );
  }
}
