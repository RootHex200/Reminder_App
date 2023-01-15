import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
String MONGODBURL =
    "";
// ignore: non_constant_identifier_names
String AUTHCOLLECTION = "auth";

// ignore: non_constant_identifier_names
String HISTORYCOLLECTION = "history";

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
