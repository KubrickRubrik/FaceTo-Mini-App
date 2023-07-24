import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';

final class ScenesQueryDrift {
  // Selected available default scenes in series
  Future<List<TableScenes>?> getScenesInSeries(ConnectDataBase db, {required int idSeries}) async {
    final query = db.select(db.useTableScenes);
    query.where((tbl) => tbl.idSeries.equals(idSeries));
    query.orderBy([(v) => OrderingTerm.asc(v.id)]);
    query.limit(30);
    final response = await query.get();
    if (response.isEmpty) return null;
    return response;
  }
}
