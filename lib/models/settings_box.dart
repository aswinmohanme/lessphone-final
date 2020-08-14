import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/hive_repo.dart';
import '../themes.dart';

class SettingsBox {
  static var _objectBox = Hive.box(SETTINGS_BOX);

  static get listenable {
    return _objectBox.listenable();
  }

  static get currentTheme {
    return segmentValueToTheme(_objectBox.get('currentTheme', defaultValue: 0));
  }

  static set currentTheme(LESSPHONE_THEMES theme) {
    _objectBox.put('currentTheme', themeToSegmentValue(theme));
  }

  static get currentFontFactor {
    return _objectBox.get('currentFontFactor', defaultValue: 1.0);
  }

  static set currentFontFactor(double factor) {
    _objectBox.put('currentFontFactor', factor);
  }

  static get doesOwnPremium {
    return _objectBox.get('doesOwnPremium', defaultValue: false);
  }

  static set doesOwnPremium(bool value) {
    _objectBox.put('doesOwnPremium', value);
  }

  static LESSPHONE_THEMES segmentValueToTheme(value) {
    switch (value) {
      case 0:
        return LESSPHONE_THEMES.light;
      case 1:
        return LESSPHONE_THEMES.black;
      case 2:
        return LESSPHONE_THEMES.yellow;
      case 3:
        return LESSPHONE_THEMES.blue;
      case 4:
        return LESSPHONE_THEMES.wall;
      default:
        return LESSPHONE_THEMES.light;
    }
  }

  static int themeToSegmentValue(LESSPHONE_THEMES theme) {
    switch (theme) {
      case LESSPHONE_THEMES.light:
        return 0;
      case LESSPHONE_THEMES.black:
        return 1;
      case LESSPHONE_THEMES.yellow:
        return 2;
      case LESSPHONE_THEMES.blue:
        return 3;
      case LESSPHONE_THEMES.wall:
        return 4;
      default:
        return 0;
    }
  }
}
