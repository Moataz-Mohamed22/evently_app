import 'package:evently_app/utils/App_Styles.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyles.bold12White,
        selectedLabelStyle: AppStyles.bold12White,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: StadiumBorder(
            side: BorderSide(
          color: AppColors.WhiteColor,
          width: 4,
        )),
        backgroundColor: AppColors.primaryLight,
      ));
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyles.bold12White,
        selectedLabelStyle: AppStyles.bold12White,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryDark,
          shape: StadiumBorder(
              side: BorderSide(
            color: AppColors.WhiteColor,
            width: 4,
          ))));
}
