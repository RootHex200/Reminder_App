import 'package:flutter/material.dart';
import 'package:work_manager/database/monogdb.dart';
import 'package:work_manager/service/deletetamdata.dart';

initlization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MognodbDatabase().connect();
  deleteTmpData();
}
