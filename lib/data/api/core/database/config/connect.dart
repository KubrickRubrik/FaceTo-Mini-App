import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/migration.dart';
import 'package:facetomini/data/api/core/database/tables/app_settings.dart';
import 'package:facetomini/data/api/core/database/tables/app_user.dart';
import 'package:facetomini/data/api/core/database/tables/scenes.dart';
import 'package:facetomini/data/api/core/database/tables/series.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:path/path.dart' as path_2;
part 'connect.g.dart';

@DriftDatabase(tables: [UseTableAppUser, UseTableAppSettings, UseTableSeries, UseTableScenes])
class ConnectDataBase extends _$ConnectDataBase {
  ConnectDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationDataBaseDrift.migration(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await path.getApplicationDocumentsDirectory();
    final file = File(path_2.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
