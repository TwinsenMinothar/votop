import 'dart:developer';

import 'package:firedart/auth/exceptions.dart';
import 'package:firedart/auth/user_gateway.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

import 'package:firedart/firedart.dart';

class UserModel extends Model {
  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  Map<String, dynamic> userData = Map();
  bool isLoading = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  login() {}

  signUp(Map<String, dynamic> userData) async {
    isLoading = true;
    notifyListeners();
    log(userData.toString());
    try {
      user = await auth.signUp(userData['email'], userData['password']);
    } on AuthException catch (e) {
      print('auth error: $e');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<Null> _loadCurrentUser() async {
    if (user == null) {
      try {
        user = await auth.getUser();
      } on SignedOutException catch (e) {
        print('Signed Out');
        return null;
      }
    }
    if (user != null) {
      if (userData["email"] == null) {
        Document docUser = await Firestore.instance
            .collection("users")
            .document(user!.id)
            .get();
        userData = docUser.map;
      }
    }
    notifyListeners();
  }
}
