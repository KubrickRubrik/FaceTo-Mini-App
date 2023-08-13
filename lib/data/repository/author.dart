import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/mapper/mapper.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/vo/author.dart';
import 'package:facetomini/domain/repository/author.dart';

final class AuthorRepositoryImpl implements AuthorRepository {
  AuthorRepositoryImpl(this.apiServer, this.apiDB);
  ApiServerDAO apiServer;
  ApiDbDAO apiDB;

  @override
  Future<({AuthorEntity? data, Failure? fail})> getAuthor(Dto dto) async {
    try {
      // Get request data from DB
      final serverClientData = await apiDB.getClientData();
      if (serverClientData == null) return (data: null, fail: null);
      //
      final response = await apiServer.getAuthor(dto, serverClientData);
      if (response == null) return (data: null, fail: null);
      final result = EntitiesMapper.setAuthor(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      return (data: null, fail: DataFormatFailuer('Error api data: $e'));
    }
  }
}
