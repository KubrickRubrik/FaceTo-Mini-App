import 'package:facetomini/data/models/scene.dart';
import 'package:facetomini/data/models/series.dart';
import 'package:facetomini/data/models/session.dart';

abstract interface class ApiDbEnvelope {
  // Authorized and settings
  Future<SessionModel?> authorized(String languageName);
  Future<SessionModel?> setTheme(String themeName);
  Future<SessionModel?> setLocale(String languageName);
  Future<SessionModel?> setSound(bool enebledSound);
  // Series
  Future<List<SeriesModel>?> getSeries();
  // Scenes of series
  Future<List<SceneModel>?> getScenesInSeries(int idSeries);
}
