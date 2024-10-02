import 'package:hive/hive.dart';
//import 'package:hive_generator/hive_generator.dart';
//import 'package:build_runner/build_runner.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart'; // Import the generated file

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  final String date;//to make it object DataTime hive can't recognise it so to do this i must create type adaptor

  @HiveField(3)
  int color;

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });
}