import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';

abstract interface class ScenesRepository {
  /// Get all scenes for series
  Future<({List<SceneEntity>? data, Failure? fail})> getScenesInSeries(int idSeries);
}
