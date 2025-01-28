import 'package:evently_app/auth/Login_Screen/Login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends ChangeNotifier {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  late LoginNavigator navigator;
  void Login() async {
    if (fromKey.currentState!.validate()) {
      navigator.showMyLoading("Waiting...");

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        navigator.hideMyLoading();
        navigator.showMessage("Login Successfully");
        print("Login Successfully");
        print(credential.user?.uid);
      } on FirebaseAuthException catch (e) {
        navigator.hideMyLoading();
        if (e.code == 'user-not-found') {
          navigator.showMessage("No user found for that email.");
        } else if (e.code == 'wrong-password') {
          navigator.showMessage("Wrong password provided for that user.");
        } else if (e.code == 'invalid-credential') {
          navigator.showMessage(
              "The supplied auth credential is malformed or has expired.");
        }
      } catch (e) {
        navigator.hideMyLoading();
        navigator.showMessage("Error: ${e.toString()}");
      }
    }
  }
}
