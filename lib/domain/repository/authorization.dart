import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/app.dart';

abstract interface class AuthorizationRepository {
  Future<({Failure? fail, AuhtorizedEntity? data})> authorization();
}
