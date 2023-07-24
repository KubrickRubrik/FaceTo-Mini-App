import 'package:facetomini/core/errors/failure.dart';

abstract interface class SeriesRepository {
  Future<({List? data, Failure? fail})> getSeries();
}
