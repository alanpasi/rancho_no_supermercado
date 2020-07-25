import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthNotifier with ChangeNotifier {
  FirebaseUser _email;

  FirebaseUser get email => _email;

  void setEmail(FirebaseUser email) {
    _email = email;
    notifyListeners();
  }
}