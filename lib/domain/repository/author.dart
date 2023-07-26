import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/author.dart';

abstract interface class AuthorRepository {
  // Get data author
  Future<({AuthorEntity? data, Failure? fail})> getAuthor(int idAuthor);
}
