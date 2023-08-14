import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';

abstract interface class SceneRepository {
  /// Selection of puzzle statistics online
  Future<({PuzzleUpdatesEntity? data, Failure? fail})> getPuzzleStatisticsOnline(Dto dto);

  /// Selection of puzzle statistics offline
  Future<({PuzzleUpdatesEntity? data, Failure? fail})> getPuzzleStatisticsOffline(Dto dto);

  /// Saving the winner's data to the database
  Future<({bool? data, Failure? fail})> updatePuzzleStatistics(Dto dto);
}
