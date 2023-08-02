import 'package:drift/drift.dart';
import 'package:facetomini/data/api/core/database/config/connect.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/dto/puzzle_stat.dart';
import 'package:facetomini/domain/entities/dto/puzzle_update.dart';

final class PuzzleRequestDrift {
  /// Selection of series statistics data and puzzle scene
  Future<({TableSeries series, TableScenes scene})?> getPuzzleStatisticsOffline(ConnectDataBase db, {required Dto dto}) async {
    dto as PuzzleDataDTO;
    final seriesTable = db.alias(db.useTableSeries, 'series');
    final sceneTable = db.alias(db.useTableScenes, 'scene');
    final query = db.select(seriesTable).join([
      leftOuterJoin(
        sceneTable,
        sceneTable.idSeries.equalsExp(seriesTable.idSeries),
      )
    ]);
    query.where(seriesTable.idSeries.equals(dto.idSeries) & sceneTable.idScene.equals(dto.idScene));
    final response = await query.getSingleOrNull();
    if (response == null) return null;
    final series = response.readTableOrNull(seriesTable);
    final scene = response.readTableOrNull(sceneTable);
    if (series == null || scene == null) return null;
    return (series: series, scene: scene);
  }

  /// Puzzle statistics update
  Future<bool?> updatePuzzleStatistics(ConnectDataBase db, {required Dto dto}) async {
    dto as PuzzleUpdateDTO;
    final seriesTable = db.alias(db.useTableSeries, 'series');
    final sceneTable = db.alias(db.useTableScenes, 'scene');
    await db.batch((b) {
      // Series statistics update
      b.update(
        seriesTable,
        UseTableSeriesCompanion(
          xp: Value(dto.series.xp),
          completed: Value(dto.series.completed),
          ratingSeries: Value(dto.series.ratingSeries),
          countUsersRating: Value(dto.series.countUsersRating),
        ),
        where: (table) => table.idSeries.equals(dto.series.idSeries),
      );
      // Scene statistics update
      b.update(
        sceneTable,
        UseTableScenesCompanion(
          xp: Value(dto.scene.xp),
          completed: Value(dto.scene.completed),
          countUsers: Value(dto.scene.countUsers),
          recordTime: Value(dto.scene.recordTime),
        ),
        where: (table) {
          return table.idSeries.equals(dto.series.idSeries) & table.idScene.equals(dto.scene.idScene);
        },
      );
    });
    return true;
  }
}
