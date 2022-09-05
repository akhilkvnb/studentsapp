import 'dart:convert';
import 'package:flutter/material.dart';

class Screen_details extends StatelessWidget {
  final String name;
  final String age;
  final String place;
  final String? image;
  const Screen_details({
    Key? key,
    required this.name,
    required this.age,
    required this.place,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  height: 540,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 175, 79, 116),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.memory(
                            const Base64Decoder().convert(image.toString())),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Name : $name',
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Age : $age',
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Place : $place',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
