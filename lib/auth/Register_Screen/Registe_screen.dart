import 'package:evently_app/Home_Screen1.dart';
import 'package:evently_app/auth/Login_Screen/login_screen.dart';
import 'package:evently_app/auth/Register_Screen/Register_Navigator.dart';
import 'package:evently_app/auth/Register_Screen/Register_Screen_View_model.dart';

import 'package:evently_app/utils/App_Styles.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:evently_app/utils/dialogeutils.dart';
import 'package:evently_app/widget/custom_elevated_Button.dart';
import 'package:evently_app/widget/custom_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RegisteScreen extends StatefulWidget {
  static String routeName = "RegisteScreen";

  @override
  State<RegisteScreen> createState() => _RegisteScreenState();
}

class _RegisteScreenState extends State<RegisteScreen>
    implements RegisterNavigator {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(text: "Moataz");

  var passwordController = TextEditingController(text: "123456");

  var emailController = TextEditingController(text: "Moataz@mohamed.com");

  var rePasswordController = TextEditingController(text: "123456");
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      
      builder: (context, child) => Scaffold(
     
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
            child: Form(
              key: formKey,
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
                    controller: nameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Name";
                      }
                      return null; 
                    },
                    hintText: AppLocalizations.of(context)!.name,
                    prefixIcon: Image.asset(AssetsManger.iconName),
                  ),
                  SizedBox(
                    height: hight * 0.02,
                  ),
                  CustomTextFiled(
                    keyboardType: TextInputType.emailAddress,
                    hintText: AppLocalizations.of(context)!.email,
                    prefixIcon: Image.asset(AssetsManger.iconEmail),
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Email";
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return "Please Enter Valid Email";
                      }
                      return null; 
                    },
                  ),
                  SizedBox(
                    height: hight * 0.02,
                  ),
                  CustomTextFiled(
                    keyboardType: TextInputType.phone,
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: Image.asset(AssetsManger.iconPassword),
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter password";
                      }
                      if (text.length < 6) {
                        return "Password Should by least 6 chars";
                      }
                      return null; 
                    },
                  ),
                  SizedBox(
                    height: hight * 0.02,
                  ),
                  CustomTextFiled(
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.rePassword,
                    prefixIcon: Image.asset(AssetsManger.iconPassword),
                    controller: rePasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please Enter Re-password";
                      }
                      if (text != passwordController.text) {
                        return "Re-Password doesn't match Password";
                      }
                      return null; //valid
                    },
                  ),
                  SizedBox(
                    height: hight * 0.02,
                  ),
                  CustomElevatedButton(
                    onButtonClicked: () {
                      if (formKey.currentState?.validate() == true) {
                        register();
                        Navigator.of(context).pushNamed(HomeScreen1.routeName);
                      } else {
                        "Invaled data ";
                      }
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
                                  Navigator.of(context).pushReplacementNamed(
                                      LoginScreen.routeName);
                                }),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      viewModel.register(emailController.text, passwordController.text);
    }
  }

  @override
  void hideMyLoading() {
    // TODO: implement hideMyLoading
    DialogeUtils.hideLoding(context);
  }

  @override
  void showMessage(String message) {
    // TODO: implement showMessage
    DialogeUtils.showMessage(
        context: context, message: message, posActionName: "Ok");
  }

  @override
  void showMyLoading(String message) {
    // TODO: implement showMyLoading
    DialogeUtils.showLoding(context: context, message: message);
  }
}
