import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/domain/repository/scene.dart';

final class SceneCase implements SceneRepository {
  SceneCase(this._scenesRepository);
  final SceneRepository _scenesRepository;

  @override
  Future<({PuzzleUpdatesEntity? data, Failure? fail})> getPuzzleStatisticsOnline(Dto dto) async {
    final response = await _scenesRepository.getPuzzleStatisticsOnline(dto);
    return response;
  }

  @override
  Future<({PuzzleUpdatesEntity? data, Failure? fail})> getPuzzleStatisticsOffline(Dto dto) async {
    final response = await _scenesRepository.getPuzzleStatisticsOffline(dto);
    return response;
  }

  @override
  Future<({bool? data, Failure? fail})> updatePuzzleStatistics(Dto dto) async {
    final response = await _scenesRepository.updatePuzzleStatistics(dto);
    return response;
  }
}
