class Task {
  final String name;
  bool isCompleted;

  Task({this.name, this.isCompleted = false});

  setCompleted(bool value) {
    this.isCompleted = value;
  }
}

class TaskRepo {
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
