import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/domain/repository/scenes.dart';

final class ScenesRepositoryImpl implements ScenesRepository {
  ScenesRepositoryImpl(this._apiDB);
  ApiDbEnvelope _apiDB;
  @override
  Future<({List? data, Failure? fail})> getScenes(int idSeries) async {
    return (data: null, fail: null);
  }
}
