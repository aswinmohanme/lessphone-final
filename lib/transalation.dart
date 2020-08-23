import "package:i18n_extension/i18n_extension.dart";

extension Localization on String {
  String get i18n => localize(this, t);
  static var t = Translations("en") +
      {
        "en": "dialer",
        "de": "dialer",
      } +
      {
        "en": "feedback",
        "de": "die reaktion",
      } +
      {
        "en": "Tasks",
        "de": "Aufgaben",
      } +
      {
        "en": "Select Custom App",
        "de": "Wählen Sie Benutzerdefinierte App",
      } +
      {
        "en": "settings",
        "de": "die einstellungen",
      } +
      {
        "en": "clear completed",
        "de": "klar abgeschlossen",
      } +
      {
        "en": "Change Theme",
        "de": "Thema ändern",
      } +
      {
        "en": "light",
        "de": "licht",
      } +
      {
        "en": "black",
        "de": "schwarz",
      } +
      {
        "en": "yellow",
        "de": "gelb",
      } +
      {
        "en": "blue",
        "de": "blau",
      } +
      {
        "en": "Settings",
        "de": "Die Einstellungen",
      } +
      {
        "en": "Number of Custom Apps",
        "de": "Anzahl der benutzerdefinierten Apps",
      } +
      {
        "en": "Font Size",
        "de": "Schriftgröße",
      } +
      {
        "en": "small",
        "de": "klein",
      } +
      {
        "en": "medium",
        "de": "das mittel",
      } +
      {
        "en": "large",
        "de": "groß",
      } +
      {
        "en": "custom apps",
        "de": "benutzerdefinierte apps",
      } +
      {
        "en": "Launcher Settings",
        "de": "Launcher Settings",
      } +
      {
        "en": "System Settings",
        "de": "System Settings",
      } +
      {
        "en": "Rate us on the Play Store",
        "de": "Bewerten Sie uns im Play Store",
      } +
      {
        "en": "Enter the Todo",
        "de": "Geben Sie das Alles ein",
      } +
      {
        "en": "Record your Task",
        "de": "Notieren Sie Ihre Aufgabe",
      } +
      {
        "en": "Do that Task",
        "de": "Mach diese Aufgabe",
      } +
      {
        "en": "Cross that Task off, Repeat",
        "de": "Kreuzen Sie diese Aufgabe an und wiederholen Sie sie",
      } +
      {
        "en": "back",
        "de": "zurück",
      };
}
