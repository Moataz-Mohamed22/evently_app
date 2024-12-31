import 'package:evently_app/Home_Screen1.dart';
import 'package:evently_app/auth/login_screen.dart';
import 'package:evently_app/home/home.dart';
import 'package:evently_app/home_Screen.dart';
import 'package:evently_app/utils/App_Styles.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:evently_app/widget/custom_elevated_Button.dart';
import 'package:evently_app/widget/custom_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisteScreen extends StatelessWidget {
  static String routeName = "RegisteScreen";
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.WhiteColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.bold14Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: hight * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetsManger.logo,
                height: hight * 0.25,
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomTextFiled(
                hintText: AppLocalizations.of(context)!.name,
                prefixIcon: Image.asset(AssetsManger.iconName),
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomTextFiled(
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: Image.asset(AssetsManger.iconEmail),
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomTextFiled(
                obscureText: true,
                hintText: AppLocalizations.of(context)!.password,
                prefixIcon: Image.asset(AssetsManger.iconPassword),
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomTextFiled(
                obscureText: true,
                hintText: AppLocalizations.of(context)!.rePassword,
                prefixIcon: Image.asset(AssetsManger.iconPassword),
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomElevatedButton(
                onButtonClicked: () {
                  Navigator.of(context).pushNamed(HomeScreen1.routeName);
                },
                text: AppLocalizations.of(context)!.create_account,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!
                              .already_have_account,
                          style: AppStyles.bold14black),
                      TextSpan(
                          text: AppLocalizations.of(context)!.login,
                          style: AppStyles.bold20Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            }),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
