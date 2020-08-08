import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/hive_repo.dart';

part 'custom_app.g.dart';

const TASK_APP_PACKAGE_NAME = "me.aswinmohan.lessphone.tasks";

@HiveType(typeId: CUSTOM_APP_BOX_TYPE_ID)
class CustomApp {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String packageName;

  CustomApp({this.name, this.packageName = ""});

  bool get isTaskApp {
    return this.packageName == TASK_APP_PACKAGE_NAME;
  }

  static var _objectBox = Hive.box(TASK_BOX);

  static listenable() {
    return _objectBox.listenable();
  }

  static count() {
    return _objectBox.length;
  }

  static get(int index) {
    return _objectBox.getAt(index);
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
