import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/repository/authorization.dart';

/// Authorization case
class AuthorizationCase implements AuthorizationRepository {
  AuthorizationCase(this._authorizationRepository);
  final AuthorizationRepository _authorizationRepository;

  @override
  Future<({Failure? fail, AuhtorizedEntity? data})> authorization() async {
    final response = await _authorizationRepository.authorization();
    return response;
  }
}
