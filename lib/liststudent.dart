// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/detaits.dart';
import 'package:studentapp/edit.dart';
import 'package:studentapp/function/mycontroller.dart';

class ListStudent extends StatelessWidget {
  ListStudent({Key? key}) : super(key: key);

  Mycontroller scontroller = Get.put(Mycontroller());

  @override
  Widget build(BuildContext context) {
    scontroller.getAllStudents();
    return GetBuilder<Mycontroller>(
      builder: (controller) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = controller.student;
            return ListTile(
              title: Text(data[index].name),
              leading: CircleAvatar(
                backgroundImage: MemoryImage(const Base64Decoder()
                    .convert(data[index].image.toString())),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(ScreenEdit(
                          name: data[index].name,
                          age: data[index].age,
                          place: data[index].place,
                          id: data[index].id,
                          image: data[index].image,
                        ));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (ctx) => ScreenEdit(
                        //           name: data[index].name,
                        //           age: data[index].age,
                        //           place: data[index].place,
                        //           id: data[index].id,
                        //           image: data[index].image,
                        //         )));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      )),
                  IconButton(
                    onPressed: () async {
                      if (data[index].id != null) {
                        await controller.deleteStudent(data[index].id!);
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.to(Screen_details(
                  name: data[index].name,
                  age: data[index].age,
                  place: data[index].place,
                  image: data[index].image,
                ));
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (ctx) => Screen_details(
                //           name: data[index].name,
                //           age: data[index].age,
                //           place: data[index].place,
                //           image: data[index].image,
                //         )));
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: controller.student.length,
        );
      },
    );
  }
}
