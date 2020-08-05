import 'package:intent/category.dart';
import 'package:intent/extra.dart';
import 'package:intent/flag.dart';
import 'package:intent/intent.dart' as Intent;
import 'package:intent/action.dart' as IntentAction;

class PlatformIntents {
  static launchBatteryIntent() {
    return Intent.Intent()
      ..setAction(IntentAction.Action.ACTION_POWER_USAGE_SUMMARY)
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..startActivity().catchError((e) => print(e));
  }

  static launchDailerIntent() {
    return Intent.Intent()
      ..setAction(IntentAction.Action.ACTION_DIAL)
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..startActivity().catchError((e) => print(e));
  }

  static launchDeviceSettings() {
    return Intent.Intent()
      ..setAction("android.settings.SETTINGS")
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..startActivity().catchError((e) => print(e));
  }

  static launchHomeSettings() {
    return Intent.Intent()
      ..setAction("android.settings.HOME_SETTINGS")
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..startActivity().catchError((e) => print(e));
  }

  static launchPlayStorePage() {
    return Intent.Intent()
      ..setAction(IntentAction.Action.ACTION_VIEW)
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..setData(Uri.parse(
          "http://play.google.com/store/apps/details?id=me.aswinmohan.nophone"))
      ..startActivity().catchError((e) => print(e));
  }

  static launchCalenderIntent() {
    return Intent.Intent()
      ..setAction(IntentAction.Action.ACTION_MAIN)
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..addCategory(Category.CATEGORY_APP_CALENDAR)
      ..startActivity().catchError((e) => print(e));
  }

  static launchAlarmClockIntent() {
    return Intent.Intent()
      ..setAction("android.intent.action.SHOW_ALARMS")
      ..addFlag(Flag.FLAG_ACTIVITY_NO_ANIMATION)
      ..startActivity().catchError((e) => print(e));
  }

  static sendEmailToDeveloper() {
    return Intent.Intent()
      ..setAction(IntentAction.Action.ACTION_SENDTO)
      ..setData(Uri(scheme: 'mailto', path: 'dev.aswinmohan@gmail.com'))
      ..putExtra(Extra.EXTRA_SUBJECT, "LessPhone Rocks!")
      ..startActivity().catchError((e) => print(e));
  }
}
