import 'package:dio/dio.dart';
import 'package:facetomini/core/config/actions.dart';
import 'package:facetomini/data/api/core/server/config/request.dart';
import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/data/models/vo/author.dart';
import 'package:facetomini/data/models/vo/server.dart';
import 'package:facetomini/data/models/vo/stat_puzzle.dart';

class ApiServer implements ApiServerDAO {
  final apiServer = Dio();

  @override
  Future<AuthorModel?> getAuthor(Dto dto, ClientModel serverData) async {
    dto.actionApi = ConfigActionsApi.authorGet;
    final response = await ConfigRequestServer.request(apiServer, dto, serverData);
    if (response == null) return null;
    return AuthorModel(response['data']['author']);
  }

  @override
  Future<PuzzleUpdatesModel?> getPuzzleStatistics(Dto dto, ClientModel serverData) async {
    dto.actionApi = ConfigActionsApi.setWinnersScene;
    final response = await ConfigRequestServer.request(apiServer, dto, serverData);
    if (response == null) return null;
    return PuzzleUpdatesModel(response['data']);
  }
}
