import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/models/author.dart';

class ApiServer implements ApiServerEnvelope {
  @override
  Future<AuthorModel?> getAuthor(int idAuthor) async {
    return null;
  }
}
