import 'package:facetomini/data/models/app.dart';

abstract interface class ApiServerEnvelope {
  Future<AuthorizedModel?> authorized();
}
