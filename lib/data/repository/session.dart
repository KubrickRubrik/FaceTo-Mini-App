import 'package:facetomini/core/errors/exception.dart';
import 'package:facetomini/core/errors/failure.dart';
import 'package:facetomini/data/api/interfaces/api_db.dart';
import 'package:facetomini/data/mapper/app.dart';
import 'package:facetomini/domain/entities/app.dart';
import 'package:facetomini/domain/repository/session.dart';

/// User authorization execution contract (in addition, the first initialization of the database occurs)
final class SessionRepositoryImpl implements SessionRepository {
  SessionRepositoryImpl(this.apiDbEnvelope);
  ApiDbEnvelope apiDbEnvelope;
  // Authorized
  @override
  Future<({SessionEntity? data, Failure? fail})> authorization(String languageName) async {
    try {
      final response = await apiDbEnvelope.authorized(languageName);
      final result = EntitiesMapper.setAuthorized(response);
      return (data: result, fail: null);
    } on ApiException catch (e) {
      return (data: null, fail: ApiFailure(e.msg));
    } catch (e) {
      throw (data: null, fail: DataFormatFailuer('Error api data'));
    }
  }
}
