import 'package:drift/drift.dart';

/// Application setting data class (voice enable, theme, application language)
@DataClassName('TableAppSettings')
class UseTableAppSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idApp => integer().withDefault(const Constant(1))();
  IntColumn get enabledSound => integer().named('enabled_sound').withDefault(const Constant(1))();
  TextColumn get language => text().withDefault(const Constant('ru'))();
  TextColumn get theme => text().withDefault(const Constant('light'))();
}
