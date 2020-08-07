import 'package:hive/hive.dart';

part 'task.g.dart';

import '../utils/hive_repo.dart';

@HiveType(typeId: TASK_BOX_TYPE_ID)
class Task extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  bool isCompleted;

  Task({this.name, this.isCompleted = false});

  setCompleted(bool value) {
    this.isCompleted = value;
  }

  static var _initialList = [
    Task(name: "Create a task"),
    Task(name: "Do that Task"),
    Task(name: "Complete that task", isCompleted: true),
  ];

  static all() {
    return _initialList;
  }

  static get(int index) {
    return _initialList.elementAt(index);
  }

  static count() {
    return _initialList.length;
  }

  static createTask(String name) {
    _initialList.insert(0, Task(name: name));
  }

  static clearCompleted() {
    _initialList.removeWhere((task) => task.isCompleted);
  }
}
