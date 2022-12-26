import 'dart:isolate';

import 'package:work_manager/database/database.dart';

deleteTmpData() {
  var date =
      DateTime.now().subtract(const Duration(days: 1)).toString().split(" ")[0];
  try {
    Isolate.spawn(deleteDataFromBG, date);
  // ignore: empty_catches
  } catch (e) {
    Isolate.spawn(deleteDataFromBG, date);
  }
}
