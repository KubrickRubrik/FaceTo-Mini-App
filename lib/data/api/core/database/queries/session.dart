import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';

final class SessionQueryDrift {
  // Authorization user
  Future<({TableAppUser user, TableAppSettings settings})?> authirized(ConnectDataBase db) async {
    final userTable = db.alias(db.useTableAppUser, 'user');
    final query = db.select(userTable).join([
      leftOuterJoin(
        db.useTableAppSettings,
        db.useTableAppSettings.idApp.equalsExp(userTable.idApp),
      )
    ]);
    query.where(userTable.id.equals(1));
    final response = await query.getSingleOrNull();

    final app = response?.readTableOrNull(userTable);
    final settings = response?.readTableOrNull(db.useTableAppSettings);

    if (app == null || settings == null) return null;
    return (user: app, settings: settings);
  }

  // Save a theme
  Future<TableAppSettings?> setTheme(ConnectDataBase db, {required String theme}) async {
    final query = (db.update(db.useTableAppSettings)..where((tbl) => tbl.id.equals(1)));
    final response = await query.writeReturning(UseTableAppSettingsCompanion(theme: Value(theme)));
    print(response);
    if (response.isEmpty) return null;
    return response.first;
  }

  // Locale saving
  Future<TableAppSettings?> setLocale(ConnectDataBase db, {required String language}) async {
    final query = (db.update(db.useTableAppSettings)..where((tbl) => tbl.id.equals(1)));
    final response = await query.writeReturning(UseTableAppSettingsCompanion(language: Value(language)));
    print(response);
    if (response.isEmpty) return null;
    return response.first;
  }

  // Saving sound
  Future<TableAppSettings?> setSound(ConnectDataBase db, {required bool enebledSound}) async {
    final query = (db.update(db.useTableAppSettings)..where((tbl) => tbl.id.equals(1)));
    final response = await query.writeReturning(UseTableAppSettingsCompanion(enabledSound: Value(enebledSound ? 1 : 0)));
    print(response);
    if (response.isEmpty) return null;
    return response.first;
  }
}
