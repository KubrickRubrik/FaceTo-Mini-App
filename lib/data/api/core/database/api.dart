import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/models/app.dart';

class ApiDb implements ApiDbEnvelope {
  // Authorization user
  @override
  Future<AuthorizedModel?> authorized() async {
    try {
      return null;
    } catch (e) {
      throw ApiException('Exception api database drift $e');
    }
  }
}
