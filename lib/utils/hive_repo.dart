import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/task.dart';
import '../models/custom_app.dart';

const TASK_BOX = "hive.task_box";
const CUSTOM_APP_BOX = "hive.custom_app_box";

const TASK_BOX_TYPE_ID = 0;
const CUSTOM_APP_BOX_TYPE_ID = 1;

class HiveRepo {
  static initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(CustomAppAdapter());

    await Hive.openBox(TASK_BOX);
    await Hive.openBox(CUSTOM_APP_BOX);
  }
}
