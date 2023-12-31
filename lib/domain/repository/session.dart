import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/vo/app.dart';

abstract interface class SessionRepository {
  // Authorized
  Future<({SessionEntity? data, Failure? fail})> authorization(String languageName);
}
