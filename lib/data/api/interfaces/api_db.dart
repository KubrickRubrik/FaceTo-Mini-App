import 'package:facetomini/data/models/app.dart';

abstract interface class ApiDbEnvelope {
  Future<AuthorizedModel?> authorized();
}
