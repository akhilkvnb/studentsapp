import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String place;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  StudentModel({
    required this.name,
    required this.age,
    required this.place,
    this.image,
    this.id,
  });
}
