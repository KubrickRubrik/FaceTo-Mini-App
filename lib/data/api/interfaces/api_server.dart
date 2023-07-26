import 'package:facetomini/data/models/author.dart';

abstract interface class ApiServerEnvelope {
  Future<AuthorModel?> getAuthor(int idAuthor);
}
