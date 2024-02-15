import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  Future<void> loginUser(String userEmail, String userPassword) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userEmail, password: userPassword);
  }

  Future<void> createUser(String userName, String userEmail, String userPassword) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);
    await credential.user!.updateDisplayName(userName);
  }
}
