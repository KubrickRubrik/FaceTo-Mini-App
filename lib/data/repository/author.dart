import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/mapper/mapper.dart';
import 'package:facetomini/domain/entities/author.dart';
import 'package:facetomini/domain/repository/author.dart';

final class AuthorRepositoryImpl implements AuthorRepository {
  AuthorRepositoryImpl(this.apiDB);
  ApiServerEnvelope apiDB;

  @override
  Future<({AuthorEntity? data, Failure? fail})> getAuthor(int idAuthor) async {
    try {
      // Get series
      final response = await apiDB.getAuthor(idAuthor);
      if (response == null) return (data: null, fail: null);
      final result = EntitiesMapper.setAuthor(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }
}
