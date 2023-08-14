import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/models/dto/dto.dart';
import 'package:facetomini/domain/entities/vo/author.dart';

abstract interface class AuthorRepository {
  // Get data author
  Future<({AuthorEntity? data, Failure? fail})> getAuthor(Dto dto);
}
