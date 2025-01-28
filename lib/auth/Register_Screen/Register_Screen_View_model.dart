import 'package:evently_app/auth/Register_Screen/Register_Navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreenViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;

 void register(String email, String password) async {
  navigator.showMyLoading("Loading...");
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userId = credential.user?.uid ?? "Unknown User";
    navigator.showMessage("Register successfully");
    print("Register successfully with User ID: $userId");

  } on FirebaseAuthException catch (e) {
    navigator.hideMyLoading();
    if (e.code == 'weak-password') {
      navigator.showMessage('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      navigator.showMessage('The email address is already in use.');
    } else {
      navigator.showMessage('Registration failed: ${e.message}');
    }
    print(e.code);
    print(e.message);
  } catch (e) {
    navigator.hideMyLoading();
    navigator.showMessage( e.toString());
    print(e);
  }
}

}
