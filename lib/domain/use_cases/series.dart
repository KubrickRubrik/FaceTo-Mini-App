import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/vo/series.dart';
import 'package:facetomini/domain/repository/series.dart';

final class SeriesCase implements SeriesRepository {
  SeriesCase(this._seriesRepository);
  final SeriesRepository _seriesRepository;

  @override
  Future<({List<SeriesEntity>? data, Failure? fail})> getSeries() async {
    final response = await _seriesRepository.getSeries();
    return response;
  }
}
