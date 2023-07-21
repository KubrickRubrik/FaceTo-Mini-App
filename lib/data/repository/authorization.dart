import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/mapper/app.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/repository/authorization.dart';

/// User authorization execution contract (in addition, the first initialization of the database occurs)
class AuthorizationRepositoryImpl implements AuthorizationRepository {
  AuthorizationRepositoryImpl(this.apiDbEnvelope);
  ApiDbEnvelope apiDbEnvelope;

  @override
  Future<({Failure? fail, AuhtorizedEntity? data})> authorization() async {
    try {
      final response = await apiDbEnvelope.authorized();
      final result = EntitiesMapper.authorizedMapper(response);
      return (fail: null, data: result);
    } on ApiException catch (e) {
      return (fail: ApiFailure(e.msg), data: null);
    } catch (e) {
      throw (fail: DataFormatFailuer('Error api data'), data: null);
    }
  }
}
