
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_manager/database/monogdb.dart';
import 'package:work_manager/model/auth_model.dart';
import 'package:work_manager/util/const.dart';
import 'package:work_manager/view/auth/login.dart';
import 'package:work_manager/view/homepage/home_page.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, int>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<int> {
  AuthNotifier() : super(0);

  Future<void> signupController(AuthModel authModel, context) async {
    var result = await MognodbDatabase().signup(authModel);

    if (result == true) {
      Fluttertoast.showToast(msg: "Singup Successfully");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false);
    }
  }

  Future<void> loginController(AuthModel authModel, context) async {
    var result = await MognodbDatabase().login(authModel);

    if (result != null) {
      AuthModel data = result;
      Fluttertoast.showToast(msg: "Login Successfully");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      SharedPreferences db = await prefs;
      db.setString("uid", data.email.toString());
      db.setString("obj", data.id.toString());
    }
  }
}
