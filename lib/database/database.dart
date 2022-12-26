import 'dart:async';
import 'dart:isolate';
import 'package:isar/isar.dart';

import 'package:work_manager/model/task_model.dart';

class IsarService {
  late Future<Isar> db;
  var receiveport = ReceivePort();
  //constructor
  IsarService() {
    db = openIsar();
  }

  //open isar database
  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([TaskModelSchema], inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> deleteTask(taskID) async {
    final isar = await db;
    isar.writeTxn(() => isar.taskModels.delete(taskID));
  }

  //updateTask
  Future<void> updateTask(value) async {}
}

Future<void> createTask(newvalue) async {
  final service = IsarService();
  final isar = await service.db;
  var data = isar.writeTxnSync<int>(() => isar.taskModels.putSync(newvalue[1]));
  newvalue[0].send(data);
}

Future<void> getTaskIsolate(value) async {
  final service = IsarService();
  final isar = await service.db;
  Stream stream = isar.taskModels
      .filter()
      .dateEqualTo(value[1])
      .watch(fireImmediately: true);
  stream.listen((event) {
    value[0].send(event);
  });
}

Future<void> deleteDataFromBG(value) async {
  final service = IsarService();
  final isar = await service.db;
  Stream stream =
      isar.taskModels.filter().dateEqualTo(value).watch(fireImmediately: true);
  stream.listen((event) {
    if(event.length!=0){
    for (int i = 0; i < event.length; i++) {
      isar.writeTxnSync(() => isar.taskModels.deleteSync(event[i].id));
    }
    }
  });
}
