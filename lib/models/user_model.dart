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

  doAuth({required String email, required String password,
    required VoidCallback onSuccessVoter, required VoidCallback onSuccessAdmin,
    required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await auth.signIn(email, password);

      await _loadCurrentUser();

      if(userData['isAdmin'])
        onSuccessAdmin();
      else
        onSuccessVoter();

      isLoading = false;
      notifyListeners();
    } on AuthException catch (e) {
      onFail();

      isLoading = false;
      notifyListeners();
      throw e;
    }
  }

  Future<void> signUp({required Map<String, dynamic> userData, required String pass}) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await auth.signUp(
        userData['email'],
        pass,
      ).then((authResult) async {
        user = authResult;

        await _saveUserData(userData);

        isLoading = false;
        notifyListeners();
      });
    } on AuthException catch (e) {
      isLoading = false;
      notifyListeners();
      throw e;
    }

    isLoading = false;
    notifyListeners();
  }
  void signOut() {
    auth.signOut();

    userData = Map();
    user = null;

    notifyListeners();
  }


  void recoveryPassword(String email) {
    auth.resetPassword(email);
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;

    await Firestore.instance.collection('users').document(user!.id)
        .set(userData);
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
      if (userData["name"] == null) {
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
