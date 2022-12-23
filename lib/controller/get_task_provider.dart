import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_manager/database/database.dart';

final getTaskProvider = StreamProvider.autoDispose.family((ref,value) async* {
  var receiveport = ReceivePort();
  StreamController streamController = StreamController();
  try {
    Isolate.spawn(getTaskIsolate, [receiveport.sendPort,value]);
  } catch (e) {
    debugPrint("Isolate error $e");
  }
  receiveport.listen((message) {
    streamController.add(message);
  });
  yield* streamController.stream;
});
