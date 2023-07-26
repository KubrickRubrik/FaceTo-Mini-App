import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/repository/author.dart';
import 'package:facetomini/domain/entities/vo/author.dart';

final class AuthorCase implements AuthorRepository {
  AuthorCase(this._authorRepository);
  final AuthorRepository _authorRepository;
  // Get data author
  @override
  Future<({AuthorEntity? data, Failure? fail})> getAuthor(Dto dto) async {
    final response = await _authorRepository.getAuthor(dto);
    return response;
  }
}
