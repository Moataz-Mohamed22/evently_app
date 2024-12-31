import 'package:evently_app/Home_Screen1.dart';
import 'package:evently_app/auth/Registe_screen.dart';
import 'package:evently_app/home/home.dart';
import 'package:evently_app/home_Screen.dart';
import 'package:evently_app/utils/App_Styles.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:evently_app/widget/custom_elevated_Button.dart';
import 'package:evently_app/widget/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: hight * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetsManger.logo,
                height: hight * 0.3,
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
              Text(
                AppLocalizations.of(context)!.forget_password,
                style: AppStyles.bold20Primary.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryLight),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomElevatedButton(
                onButtonClicked: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen1.routeName);
                },
                text: AppLocalizations.of(context)!.login,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RegisteScreen.routeName);
                },
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!
                              .dont_have_an_account,
                          style: AppStyles.bold14black),
                      TextSpan(
                          text: AppLocalizations.of(context)!.create_account,
                          style: AppStyles.bold20Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight)),
                    ])),
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      endIndent: 20,
                      indent: 10,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: AppStyles.bold20Primary,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: AppColors.primaryLight,
                      endIndent: 20,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hight * 0.02,
              ),
              CustomElevatedButton(
                  onButtonClicked: () {},
                  prefixIconButton: Image.asset(AssetsManger.iconGoogle),
                  textStyle: AppStyles.medium16Primary,
                  backgroundColor: AppColors.WhiteColor,
                  text: AppLocalizations.of(context)!.login_with_google)
            ],
          ),
        ),
      ),
    );
  }
}
