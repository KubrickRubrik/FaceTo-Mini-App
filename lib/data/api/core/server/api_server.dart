import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/models/app.dart';

class ApiServer implements ApiServerEnvelope {
  @override
  Future<AuthorizedModel?> authorized() async {
    return null;
  }
}
