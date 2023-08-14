import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/vo/series.dart';

abstract interface class SeriesRepository {
  // Get all available default series
  Future<({List<SeriesEntity>? data, Failure? fail})> getSeries();
}
