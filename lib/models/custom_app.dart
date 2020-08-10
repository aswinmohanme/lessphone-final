import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/hive_repo.dart';

part 'custom_app.g.dart';

const TASK_APP_PACKAGE_NAME = "me.aswinmohan.lessphone.tasks";

@HiveType(typeId: CUSTOM_APP_BOX_TYPE_ID)
class CustomApp extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String packageName;

  CustomApp({this.name, this.packageName = ""});

  bool get isTaskApp {
    return this.packageName == TASK_APP_PACKAGE_NAME;
  }

  static var _objectBox = Hive.box(CUSTOM_APP_BOX);

  static listenable() {
    return _objectBox.listenable();
  }

  static count() {
    return _objectBox.length;
  }

  static get(var key) {
    return _objectBox.get(key);
  }

  static getAt(int index) {
    return _objectBox.getAt(index);
  }

  setCustomApp(String appName, String packageName) {
    this.name = appName;
    this.packageName = packageName;
    this.save();
  }

  get isSelectCustomApp {
    return this.packageName == "";
  }

  resetApp() {
    if (this.key == 0) {
      this.name = "Tasks";
      this.packageName = TASK_APP_PACKAGE_NAME;
    } else {
      this.name = "Select Custom App";
      this.packageName = "";
    }
    this.save();
  }

  static addCustomApp() {
    _objectBox.add(CustomApp(name: "test", packageName: "test"));
  }

  static setNumberOfApps(int numberOfApps) {
    if (_objectBox.length < numberOfApps) {
      int numberOfAppsToAdd = numberOfApps - _objectBox.length;
      for (int i = 0; i < numberOfAppsToAdd; ++i) {
        _objectBox.add(CustomApp(name: "Select Custom App"));
      }
    } else if (_objectBox.length > numberOfApps) {
      int numberOfAppsToDelete = _objectBox.length - numberOfApps;
      for (int i = numberOfAppsToDelete; i > 0; --i) {
        _objectBox.deleteAt(numberOfApps + i - 1);
      }
    }
  }

  static get isEmpty {
    return _objectBox.isEmpty;
  }

  static initCustomApps() {
    _objectBox.add(
      CustomApp(name: "Tasks", packageName: TASK_APP_PACKAGE_NAME),
    );
    _objectBox.addAll([
      CustomApp(name: "Select Custom App"),
      CustomApp(name: "Select Custom App"),
      CustomApp(name: "Select Custom App"),
    ]);
  }
}
