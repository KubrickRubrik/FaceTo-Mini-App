import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/dto/puzzle_stat.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/repository/scenes.dart';

final class ScenesCase implements ScenesRepository {
  ScenesCase(this._scenesRepository);
  final ScenesRepository _scenesRepository;

  @override
  Future<({List<SceneEntity>? data, Failure? fail})> getScenesInSeries(int idSeries) async {
    final response = await _scenesRepository.getScenesInSeries(idSeries);
    return response;
  }
}
