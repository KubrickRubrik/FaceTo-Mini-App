import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/mapper/mapper.dart';
import 'package:facetomini/domain/entities/vo/series.dart';
import 'package:facetomini/domain/repository/series.dart';

/// Class for performing operations with series data
final class SeriesRepositoryImpl implements SeriesRepository {
  SeriesRepositoryImpl(this._apiDb);
  final ApiDbDAO _apiDb;
  // Get all series
  @override
  Future<({List<SeriesEntity>? data, Failure? fail})> getSeries() async {
    try {
      // Get series
      final response = await _apiDb.getSeries();
      if (response == null) return (data: null, fail: null);
      final listSeries = response.map((e) => EntitiesMapper.setSeries(e)).toList();
      return (data: listSeries, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error api data: $e'));
    }
  }
}
