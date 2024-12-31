import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String _appLanguage = "en"; // Default language
  String get appLanguage => _appLanguage; // Getter for the current language

  AppLanguageProvider() {
    _loadLanguageFromPrefs(); // Load the saved language when the provider is initialized
  }

  /// Change the language and save it to SharedPreferences
  void changeLanguage(String newLanguage) async {
    if (_appLanguage == newLanguage) {
      return; // No need to change if the language is the same
    } else {
      _appLanguage = newLanguage;
      notifyListeners(); // Notify listeners to rebuild UI
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('appLanguage', newLanguage); // Save the new language
    }
  }

  /// Load the saved language from SharedPreferences
  void _loadLanguageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _appLanguage = prefs.getString('appLanguage') ?? "en"; // Default to "en" if not saved
    notifyListeners(); // Notify listeners to rebuild UI with the saved language
  }
}
