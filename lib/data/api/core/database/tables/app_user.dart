import 'package:drift/drift.dart';

/// User public data class
@DataClassName('TableAppUser')
class UseTableAppUser extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idApp => integer().withDefault(const Constant(1))();
}
