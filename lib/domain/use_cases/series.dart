import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/repository/series.dart';

final class SeriesCase implements SeriesRepository {
  SeriesCase(this._seriesRepository);
  SeriesRepository _seriesRepository;
  @override
  Future<({List? data, Failure? fail})> getSeries() async {
    return (data: null, fail: null);
  }
}
