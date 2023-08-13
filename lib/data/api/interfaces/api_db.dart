import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/data/models/vo/scene.dart';
import 'package:facetomini/data/models/vo/series.dart';
import 'package:facetomini/data/models/vo/server.dart';
import 'package:facetomini/data/models/vo/session.dart';
import 'package:facetomini/data/models/vo/stat_puzzle.dart';

abstract interface class ApiDbDAO {
  //
  Future<ClientModel?> getClientData();
  // Authorized and settings
  Future<SessionModel?> authorized(String languageName);
  Future<SessionModel?> setTheme(String themeName);
  Future<SessionModel?> setLocale(String languageName);
  Future<SessionModel?> setSound(bool enebledSound);
  // Series
  Future<List<SeriesModel>?> getSeries();
  // Scenes of series
  Future<List<SceneModel>?> getScenesInSeries(int idSeries);
  // Puzzle
  Future<PuzzleUpdatesModel?> getPuzzleStatisticsOffline(Dto dto);
  Future<bool?> updatePuzzleStatistics(Dto dto);
}
