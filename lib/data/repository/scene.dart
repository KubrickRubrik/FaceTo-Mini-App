import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/mapper/mapper.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/domain/repository/scene.dart';

final class SceneRepositoryImpl implements SceneRepository {
  SceneRepositoryImpl(this.apiDB, this.apiServer);
  ApiServerDAO apiServer;
  ApiDbDAO apiDB;
  @override
  Future<({PuzzleUpdatesEntity? data, Failure? fail})> getPuzzleStatisticsOnline(Dto dto) async {
    try {
      // Get request data from DB
      final serverClientData = await apiDB.getClientData();
      if (serverClientData == null) return (data: null, fail: null);
      //
      final response = await apiServer.getPuzzleStatistics(dto, serverClientData);
      if (response == null) return (data: null, fail: null);
      final result = EntitiesMapper.setPuzzleUpdates(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error api data: $e'));
    }
  }

  @override
  Future<({PuzzleUpdatesEntity? data, Failure? fail})> getPuzzleStatisticsOffline(Dto dto) async {
    try {
      final response = await apiDB.getPuzzleStatisticsOffline(dto);
      if (response == null) return (data: null, fail: null);
      final result = EntitiesMapper.setPuzzleUpdates(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error api data: $e'));
    }
  }

  @override
  Future<({bool? data, Failure? fail})> updatePuzzleStatistics(Dto dto) async {
    try {
      final response = await apiDB.updatePuzzleStatistics(dto);
      return (data: response, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error api data: $e'));
    }
  }
}
