import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/author.dart';
import 'package:facetomini/domain/repository/author.dart';

final class AuthorCase implements AuthorRepository {
  AuthorCase(this._authorRepository);
  final AuthorRepository _authorRepository;
  // Get data author
  @override
  Future<({AuthorEntity? data, Failure? fail})> getAuthor(int idAuthor) async {
    final response = await _authorRepository.getAuthor(idAuthor);
    return response;
  }
}
