import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/scene.dart';
import 'package:facetomini/domain/repository/scenes.dart';

final class ScenesCase implements ScenesRepository {
  ScenesCase(this._scenesRepository);
  ScenesRepository _scenesRepository;

  @override
  Future<({List<SceneEntity>? data, Failure? fail})> getScenesInSeries(int idSeries) async {
    final response = await _scenesRepository.getScenesInSeries(idSeries);
    return response;
  }
}
