import 'package:collection/collection.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/dto/puzzle_stat.dart';
import 'package:facetomini/domain/entities/vo/author.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/domain/use_cases/scene.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final class WinnerEntity {
  final winnerRecordUser = RecordUser();
  final winnerViewUser = RecordUser();
  final winnerOffline = WinnerOffline();

  /// Saving updated puzzle statistics.
  /// Request statistics of puzzle winners to compare with user statistics.
  /// If the Internet is not available, the user is shown only their own statistics
  Future<PuzzleUpdatesEntity?> saveDataWinner({
    required SeriesProvider seriesProvider,
    required ScenesProvider scenesProvider,
    required SceneCase sceneCase,
    required PuzzleDataDTO data,
  }) async {
    final hasConnection = await InternetConnectionChecker().hasConnection;
    // ({PuzzleUpdatesEntity? data, Failure? fail})? response;
    PuzzleUpdatesEntity? updatesData;

    //? If the Internet connected, try to get the stat of the puzzle of the scene
    if (hasConnection) {
      final response = await sceneCase.getPuzzleStatisticsOnline(data);
      if (response.fail == null && response.data != null) {
        updatesData = _checkingCompletenessScenes(
          seriesProvider: seriesProvider,
          scenesProvider: scenesProvider,
          updatesData: response.data!,
        );
      }
    }

    //? If there is no Internet or the data could not be obtained
    if (!hasConnection || updatesData == null) {
      // If the Internet is unavailable
      final response = await sceneCase.getPuzzleStatisticsOffline(data);
      if (response.fail == null && response.data != null) {
        updatesData = _checkingCompletenessScenes(
          seriesProvider: seriesProvider,
          scenesProvider: scenesProvider,
          updatesData: response.data!,
        );
      }
    }
    if (updatesData == null) return null;
    // else {

    //   if (response != null && response.fail == null && response.data != null) {}
    //   updatesData = _checkingCompletenessScenes(
    //     seriesProvider: seriesProvider,
    //     scenesProvider: scenesProvider,
    //     updatesData: updatesData,
    //   );
    //   // response = await sceneCase.saveWinner(data);
    // }
    // if (updatesData == null) return null;
    // Performing an update of scene and series data in the device database
    sceneCase.updatePuzzleStatistics(updatesData);
  }

  /// Checking the completeness of all scenes in the series and completeness of series
  PuzzleUpdatesEntity? _checkingCompletenessScenes({
    required SeriesProvider seriesProvider,
    required ScenesProvider scenesProvider,
    required PuzzleUpdatesEntity updatesData,
  }) {
    final series = seriesProvider.pageData.listSeries.firstWhereOrNull((s) => s.idSeries == updatesData.series.idSeires);
    final scene = scenesProvider.pageData.listScenes.firstWhereOrNull((s) => s.idScene == updatesData.scene.idScene);
    if (series == null || scene == null) return null;
    scene.user.stat.completed = 1;
    final countCompleteScenes = scenesProvider.pageData.listScenes.where((s) => s.user.stat.completed == 1).length;
    // Set series completion status
    if (series.stat.countScenes == countCompleteScenes) {
      updatesData.series.completed = 1;
    } else {
      updatesData.series.completed = 0;
    }
    return updatesData;
  }
}

class RecordUser {
  int? idApp = 0;
  String nick = '';
  ImageAuthor image = ImageAuthor.empty();
  int pos = 0;
  int xp = 0;
  int time = 0;
  int toNextTime = 0;
  int toLastTime = 0;
  int _diff = 0;

  setData(Map _data, int _toNextTime, int _toLastTime) {
    // 15,11
    // idApp = _data['id_app'];
    // nick = _data['nick'];
    // pos = _data['stat']['pos'];
    // time = _data['stat']['time'];
    // xp = _data['stat']['xp'];
    // image.setLogoData(_data);
    // toNextTime = time - _toNextTime;
    // _diff = _toLastTime - time;
    // toLastTime = (_diff > 0) ? _diff : 0;
  }

  void clear() {
    idApp = 0;
  }
}

class WinnerOffline {
  int recordTime = 0;
  int userTime = 0;
  int diffTime = 0;
  int record = -1;
  int places = 1;

  setData(int _recordTime, int _userTime) {
    recordTime = _recordTime;
    userTime = _userTime;
    diffTime = _userTime - _recordTime;
    record = (diffTime < 0) ? 1 : -1;

    if (diffTime < 0)
      places = 1;
    else if (diffTime == 0)
      places = 2;
    else {
      places = (diffTime / 5000).round();
      if (places == 0) places = 2;
    }
  }
}
