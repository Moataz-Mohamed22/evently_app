import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProviders extends ChangeNotifier {
  ThemeMode _appTheme = ThemeMode.light; // Default theme
  ThemeMode get appTheme => _appTheme; // Getter for current theme

  AppThemeProviders() {
    _loadThemeFromPrefs(); // Load saved theme on initialization
  }

  /// Change the theme and save it to SharedPreferences
  void changeTheme(ThemeMode newTheme) async {
    if (_appTheme == newTheme) {
      return; // No change needed if the theme is the same
    }
    _appTheme = newTheme;
    notifyListeners(); // Notify listeners to rebuild the UI
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('appTheme', newTheme == ThemeMode.dark ? 'dark' : 'light'); // Save theme
  }

  /// Check if the current theme is dark mode
  bool isDarkMode() {
    return _appTheme == ThemeMode.dark;
  }

  /// Load the saved theme from SharedPreferences
  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('appTheme');
    if (savedTheme != null) {
      _appTheme = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners(); // Notify listeners to rebuild UI with saved theme
    }
  }
}
