import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/mapper/mapper.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/repository/scenes.dart';

/// Class for performing operations on scene data
final class ScenesRepositoryImpl implements ScenesRepository {
  ScenesRepositoryImpl(this.apiDB);
  ApiDbDAO apiDB;
  // Get all scenes in series
  @override
  Future<({List<SceneEntity>? data, Failure? fail})> getScenesInSeries(int idSeries) async {
    try {
      // Get series
      final response = await apiDB.getScenesInSeries(idSeries);
      if (response == null) return (data: null, fail: null);
      final listScenes = response.map((e) => EntitiesMapper.setScene(e)).toList();
      return (data: listScenes, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error api data: $e'));
    }
  }
}
