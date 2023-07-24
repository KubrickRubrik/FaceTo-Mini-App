import 'package:drift/drift.dart';

@DataClassName('TableSeries')
class UseTableSeries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idSeries => integer().unique().named('id_series')();
  IntColumn get idImage => integer().named('id_image')();
  IntColumn get typeView => integer().named('type_view')();
  // author
  IntColumn get idApp => integer().named('id_app')();
  TextColumn get nick => text().named('nick_app')();
  // view user
  IntColumn get xp => integer()();
  IntColumn get rating => integer()();
  IntColumn get completed => integer()();
  IntColumn get favorites => integer()();
  //
  IntColumn get typeTree => integer().named('type_tree')();
  IntColumn get hardLevel => integer().named('hard_level')();
  //
  IntColumn get bestTime => integer().named('best_time')();
  // stat
  IntColumn get ratingSeries => integer().named('rating_series')();
  IntColumn get countUsersRating => integer().named('count_users_rating')();
  IntColumn get countUsers => integer().named('count_users')();
  IntColumn get countScenes => integer().named('count_scenes')();
}
