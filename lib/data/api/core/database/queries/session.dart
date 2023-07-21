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
    final userTable = db.alias(db.useTableAppUser, 'user');
    return null;
  }

  // Locale saving
  Future<TableAppSettings?> setLocale(ConnectDataBase db, {required String language}) async {
    final userTable = db.alias(db.useTableAppUser, 'user');
    return null;
  }

  // Saving sound
  Future<TableAppSettings?> setSound(ConnectDataBase db, {required bool enebledSound}) async {
    final userTable = db.alias(db.useTableAppUser, 'user');
    return null;
  }
}
