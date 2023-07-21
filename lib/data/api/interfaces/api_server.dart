import 'package:facetomini/data/models/session.dart';

abstract interface class ApiServerEnvelope {
  Future<SessionModel?> authorized();
}
