import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:path/path.dart' as path_2;

LazyDatabase connect() {
  return LazyDatabase(() async {
    final dbFolder = await path.getApplicationDocumentsDirectory();
    final pathDB = path_2.join(dbFolder.path, 'db.sqlite');
    final file = File(pathDB);
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
