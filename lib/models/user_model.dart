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

  doAuth(Map<String, dynamic> credentials) async {
    isLoading = true;
    notifyListeners();
    print(credentials.toString());
    try {
      if (credentials['signUp'])
        user = await auth.signUp(credentials['email'], credentials['password']);
      else {
        user = await auth.signIn(credentials['email'], credentials['password']);
      }
      print('logged in');
    } on AuthException catch (e) {
      isLoading = false;
      notifyListeners();
      throw e;
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
