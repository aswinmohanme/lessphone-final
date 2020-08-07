const TASK_APP_PACKAGE_NAME = "me.aswinmohan.lessphone.tasks";

class CustomApp {
  final String name;
  final String packageName;

  CustomApp({this.name, this.packageName = ""});

  bool get isTaskApp {
    return this.packageName == TASK_APP_PACKAGE_NAME;
  }

  static var _initialList = [
    CustomApp(name: "Tasks", packageName: TASK_APP_PACKAGE_NAME),
    CustomApp(name: "Whatsapp", packageName: "com.whatsapp"),
    CustomApp(name: "Select Custom App"),
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
}
