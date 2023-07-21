import 'package:drift/drift.dart';

@DataClassName('TableScenes')
class UseTableScenes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idScene => integer().named('id_scene')();
  IntColumn get idSeries => integer().named('id_series')();
  IntColumn get idImage => integer().named('id_image')();
  IntColumn get typeView => integer().named('type_view')();
  // author
  IntColumn get idApp => integer().named('id_app')();
  // view user
  IntColumn get xp => integer()();
  IntColumn get completed => integer().withDefault(const Constant(0))();
  //
  TextColumn get grid => text()();
  // stat
  IntColumn get countUsers => integer().named('count_users')();
  IntColumn get recordTime => integer().named('record_time')();
}
