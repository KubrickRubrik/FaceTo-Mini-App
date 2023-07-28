import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';

final class ServerRequestDrift {
  // Selecting the data required for a request to the server
  Future<({TableAppUser user, TableAppSettings settings})?> getServerData(ConnectDataBase db) async {
    final userTable = db.alias(db.useTableAppUser, 'user');
    final settingsTable = db.alias(db.useTableAppSettings, 'settings');
    final query = db.select(userTable).join([
      leftOuterJoin(
        settingsTable,
        settingsTable.idApp.equalsExp(userTable.idApp),
      ),
    ]);
    query.where(userTable.id.equals(1));
    final response = await query.getSingleOrNull();

    final app = response?.readTableOrNull(userTable);
    final settings = response?.readTableOrNull(settingsTable);

    if (app == null || settings == null) return null;
    return (user: app, settings: settings);
  }
}
