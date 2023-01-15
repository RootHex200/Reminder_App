// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:work_manager/model/auth_model.dart';
import 'package:work_manager/util/const.dart';

class MognodbDatabase {
  static var db, userCollection, auth;
  connect() async {
    db = await Db.create(MONGODBURL);
    await db.open();
    userCollection = db.collection(HISTORYCOLLECTION);
    auth = db.collection(AUTHCOLLECTION);
    // ignore: avoid_print
  }

  Future<dynamic> login(AuthModel authModel) async {
    try {
      final user = await auth.findOne({
        "email": authModel.email.toString().trim(),
        "password": authModel.password.toString().trim()
      });
      if (user != null) {
        return AuthModel.fromMap(user);
      } else {
        Fluttertoast.showToast(msg: "user not found");
      }
    // ignore: empty_catches
    } catch (e) {

    }
  }

  Future<dynamic> signup(AuthModel authModel) async {
    try {
      final user = await auth.findOne({"email": authModel.email.toString().trim()});
      if (user == null || user.length == 0) {
        var result = await auth.insert(authModel.toMap());
        if (result != null) {
          return true;
        } else {
          return false;
        }
      } else {
        Fluttertoast.showToast(msg: "User Already Exist");
      }
    // ignore: empty_catches
    } catch (e) {
    }
  }
}
