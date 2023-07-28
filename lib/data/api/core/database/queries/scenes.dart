import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';

final class ScenesRequestDrift {
  // Selected available default scenes in series
  Future<List<({TableScenes scene, int typeTree, int hardLevel})>?> getScenesInSeries(ConnectDataBase db, {required int idSeries}) async {
    final scenesTable = db.alias(db.useTableScenes, 'scenes');
    final seriesTable = db.alias(db.useTableSeries, 'series');
    final query = db.select(scenesTable).join([
      leftOuterJoin(
        seriesTable,
        seriesTable.idSeries.equalsExp(scenesTable.idSeries),
      )
    ]);
    query.where(scenesTable.idSeries.equals(idSeries));
    query.orderBy([OrderingTerm.asc(scenesTable.id)]);
    query.limit(30);
    //
    final response = await query.get();
    if (response.isEmpty) return null;

    final List<({TableScenes scene, int typeTree, int hardLevel})> result = [];
    for (var e in response) {
      final scenes = e.readTableOrNull(scenesTable);
      final series = e.readTableOrNull(seriesTable);
      if (scenes != null && series != null) {
        result.add((scene: scenes, typeTree: series.typeTree, hardLevel: series.hardLevel));
      }
    }

    return result;
  }
}
