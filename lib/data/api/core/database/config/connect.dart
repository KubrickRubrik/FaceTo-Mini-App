import 'dart:io';

import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/migration.dart';
import 'package:facetomini/data/api/core/database/tables/app_settings.dart';
import 'package:facetomini/data/api/core/database/tables/app_user.dart';
import 'package:facetomini/data/api/core/database/tables/scenes.dart';
import 'package:facetomini/data/api/core/database/tables/series.dart';

import 'connect/controller.dart' as imlp;

part 'connect.g.dart';

@DriftDatabase(tables: [UseTableAppUser, UseTableAppSettings, UseTableSeries, UseTableScenes])
class ConnectDataBase extends _$ConnectDataBase {
  ConnectDataBase({this.language}) : super(imlp.connect());
  final String? language;

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationDataBaseDrift.migration(this, language: language);
}
