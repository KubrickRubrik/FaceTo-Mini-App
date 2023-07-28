import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';

final class SeriesRequestDrift {
  // Selected available default series
  Future<List<TableSeries>?> getSeries(ConnectDataBase db) async {
    final query = db.select(db.useTableSeries);
    query.orderBy([(v) => OrderingTerm.asc(v.id)]);
    query.limit(30);
    final response = await query.get();
    if (response.isEmpty) return null;
    return response;
  }
}
