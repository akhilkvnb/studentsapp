import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/liststudent.dart';
import 'package:studentapp/model/addstudent.dart';
import 'package:studentapp/search.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Details',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SearchBar());
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (ctx) => SearchBar()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListStudent(),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudent());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
