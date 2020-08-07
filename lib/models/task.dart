import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/hive_repo.dart';

part 'task.g.dart';

@HiveType(typeId: TASK_BOX_TYPE_ID)
class Task extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  bool isCompleted;

  Task({this.name, this.isCompleted = false});

  static var _objectBox = Hive.box(TASK_BOX);

  static listenable() {
    return _objectBox.listenable();
  }

  static count() {
    return _objectBox.length;
  }

  static createTask(String name) {
    _objectBox.add(Task(name: name));
  }

  static clearCompleted() {
    var completedTasksKeys = [];
    _objectBox.keys.toList().forEach((key) {
      Task task = _objectBox.get(key);
      if (task.isCompleted) completedTasksKeys.add(key);
    });
    _objectBox.deleteAll(completedTasksKeys);
  }

  setCompleted(bool value) {
    this.isCompleted = value;
    this.save();
  }
}
