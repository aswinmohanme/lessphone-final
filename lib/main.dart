import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter/services.dart';
import "package:i18n_extension/i18n_widget.dart";

import './screens/home_screen.dart';
import 'themes.dart';
import 'utils/hive_repo.dart';
import 'utils/no_scroll_glow.dart';
import './models/settings_box.dart';

void main() async {
  await HiveRepo.initHive();
  InAppPurchaseConnection.enablePendingPurchases();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(Lessphone());
}

class Lessphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: SettingsBox.listenable,
      builder: (context, box, _) {
        return MaterialApp(
          theme: buildLessphoneTheme(SettingsBox.currentTheme),
          home: I18n(
            initialLocale: Locale("de"),
            child: HomeScreen(),
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaleFactor: SettingsBox.currentFontFactor),
              child: ScrollConfiguration(
                child: child,
                behavior: NoScrollGlow(),
              ),
            );
          },
        );
      },
    );
  }
}
