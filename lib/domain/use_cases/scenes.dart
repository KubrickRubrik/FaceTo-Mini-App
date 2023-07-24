import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/repository/scenes.dart';

final class ScenesCase implements ScenesRepository {
  ScenesCase(this._seriesRepository);
  ScenesRepository _seriesRepository;

  @override
  Future<({List? data, Failure? fail})> getScenes(int idSeries) async {
    return (data: null, fail: null);
  }
}
