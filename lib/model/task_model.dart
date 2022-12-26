
import 'package:isar/isar.dart';

part 'task_model.g.dart';

@Collection()
class TaskModel {
  Id? id = Isar.autoIncrement;
  String title;
  String description;
  String startTime;
  String endTime;
  String date;
  String colors;
  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.colors
  });

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime,date: $date,colors: $colors)';
  }
}
