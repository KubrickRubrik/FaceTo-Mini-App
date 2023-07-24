import 'package:facetomini/core/errors/failure.dart';

abstract interface class ScenesRepository {
  Future<({List? data, Failure? fail})> getScenes(int idSeries);
}
