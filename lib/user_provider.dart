import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = 'Omar Ashraf'; // Default username

  String get username => _username;

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }
}