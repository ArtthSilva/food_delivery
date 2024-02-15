import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  Future<bool> loginUser(String userEmail, String userPassword) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userEmail, password: userPassword);

    final user = credential.user;
    if (user != null && !user.emailVerified) {
      return false;
    }
    return true;
  }

  Future<void> registerUser(
      String userName, String userEmail, String userPassword) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);
    await credential.user!.updateDisplayName(userName);
    await credential.user?.sendEmailVerification();
  }
}
