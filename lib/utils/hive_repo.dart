import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/task.dart';

const TASK_BOX = "hive.task_box";

const TASK_BOX_TYPE_ID = 0;

class HiveRepo {
  static initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox(TASK_BOX);
  }
}
