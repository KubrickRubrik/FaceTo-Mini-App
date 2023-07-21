import 'package:facetomini/data/api/interfaces/api_server.dart';
import 'package:facetomini/data/models/session.dart';

class ApiServer implements ApiServerEnvelope {
  @override
  Future<SessionModel?> authorized() async {
    return null;
  }
}
