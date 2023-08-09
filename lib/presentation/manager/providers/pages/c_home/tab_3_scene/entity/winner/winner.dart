import 'dart:io';
import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:facetomini/domain/entities/dto/puzzle_stat.dart';
import 'package:facetomini/domain/entities/dto/puzzle_update.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/domain/use_cases/scene.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_3_scene/entity/winner/entity/data/controller.dart';

final class WinnerEntity {
  final data = WinnerControllerData();

  /// Saving updated puzzle statistics.
  /// Request statistics of puzzle winners to compare with user statistics.
  /// If the Internet is not available, the user is shown only their own statistics
  Future<PuzzleUpdatesEntity?> saveDataWinner({
    required SeriesProvider seriesProvider,
    required ScenesProvider scenesProvider,
    required SceneCase sceneCase,
    required PuzzleDataDTO data,
  }) async {
    // final hasConnection = await InternetConnectionChecker().hasConnection;
    final hasConnection = await (Connectivity().checkConnectivity());
    // final hasConnection = false;
    PuzzleUpdatesEntity? updatesData;
    print("ПОДКЛЮЧЕНИЕ: $hasConnection");
    //? If the Internet connected, try to get the stat of the puzzle of the scene in online
    if (hasConnection != ConnectivityResult.none) {
      final response = await sceneCase.getPuzzleStatisticsOnline(data);
      if (response.fail != null) {
        print(response.fail?.msg);
      } else if (response.fail == null && response.data != null) {
        updatesData = _checkingCompletenessScenes(
          seriesProvider: seriesProvider,
          scenesProvider: scenesProvider,
          updatesData: response.data!,
        );
        if (updatesData != null) updatesData.isOnline = true;
      }
    }

    //? If there is no Internet or the data could not be obtained,
    //?  try to get the stat of the puzzle of the scene in offline
    if (hasConnection == ConnectivityResult.none || updatesData == null) {
      // If the Internet is unavailable
      final response = await sceneCase.getPuzzleStatisticsOffline(data);
      if (response.fail != null) {
        print(response.fail?.msg);
      } else if (response.fail == null && response.data != null) {
        updatesData = _checkingCompletenessScenes(
          seriesProvider: seriesProvider,
          scenesProvider: scenesProvider,
          updatesData: response.data!,
        );
        if (updatesData != null) updatesData.isOnline = false;
      }
    }
    if (updatesData == null) return null;
    //? Change key scene data to be overwritten in the database
    data.timeRecord = updatesData.scene.recordTime;
    if (data.timeUser < data.timeRecord) updatesData.scene.recordTime = data.timeUser;
    //? Data generation rewrite statistics puzzle
    final dto = PuzzleUpdateDTO(
      series: SeriesPuzzleUpdate(
        idSeries: updatesData.series.idSeires,
        xp: updatesData.series.xp,
        completed: updatesData.series.completed,
        ratingSeries: updatesData.series.ratingSeries,
        countUsersRating: updatesData.series.countUsersRating,
        countUsers: updatesData.series.countUsers,
      ),
      scene: ScenePuzzleUpdate(
        idScene: updatesData.scene.idScene,
        xp: updatesData.scene.xp,
        completed: updatesData.scene.completed,
        recordTime: updatesData.scene.recordTime,
        countUsers: updatesData.scene.countUsers,
      ),
    );
    //? Performing an update of scene and series data in the device database
    final response = await sceneCase.updatePuzzleStatistics(dto);
    if (response.data != true || response.fail != null) {
      print(response.fail?.msg);
      return null;
    }
    return updatesData;
  }

  /// Checking the completeness of all scenes in the series and completeness of series.
  /// Setting the `completed = 1` or `not completed = -1` status for a scene and series
  PuzzleUpdatesEntity? _checkingCompletenessScenes({
    required SeriesProvider seriesProvider,
    required ScenesProvider scenesProvider,
    required PuzzleUpdatesEntity updatesData,
  }) {
    final series = seriesProvider.pageData.listSeries.firstWhereOrNull((s) => s.idSeries == updatesData.series.idSeires);
    final scene = scenesProvider.pageData.listScenes.firstWhereOrNull((s) => s.idScene == updatesData.scene.idScene);
    if (series == null || scene == null) return null;
    scene.user.stat.completed = 1;
    updatesData.scene.completed = 1;
    final countCompleteScenes = scenesProvider.pageData.listScenes.where((s) => s.user.stat.completed == 1).length;
    // Set series completion status
    if (series.stat.countScenes == countCompleteScenes) {
      updatesData.series.completed = 1;
    } else {
      updatesData.series.completed = 0;
    }
    return updatesData;
  }

  ///
  void formatWinner({
    required PuzzleUpdatesEntity updateData,
    required PuzzleDataDTO puzzleData,
  }) {
    data.setWinner(updateData: updateData, puzzleData: puzzleData);
  }
}
