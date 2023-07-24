import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/domain/repository/series.dart';

final class SeriesRepositoryImpl implements SeriesRepository {
  SeriesRepositoryImpl(this._apiDB);
  ApiDbEnvelope _apiDB;
  @override
  Future<({List? data, Failure? fail})> getSeries() async {
    return (data: null, fail: null);
  }
}
