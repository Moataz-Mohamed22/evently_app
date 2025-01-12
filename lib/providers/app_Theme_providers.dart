import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProviders extends ChangeNotifier {
  ThemeMode _appTheme = ThemeMode.light; 
  ThemeMode get appTheme => _appTheme; 

  AppThemeProviders() {
    _loadThemeFromPrefs(); 
  }

  void changeTheme(ThemeMode newTheme) async {
    if (_appTheme == newTheme) {
      return; 
    }
    _appTheme = newTheme;
    notifyListeners();  
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('appTheme', newTheme == ThemeMode.dark ? 'dark' : 'light'); // Save theme
  }

  bool isDarkMode() {
    return _appTheme == ThemeMode.dark;
  }

  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('appTheme');
    if (savedTheme != null) {
      _appTheme = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners(); 
    }
  }
}
