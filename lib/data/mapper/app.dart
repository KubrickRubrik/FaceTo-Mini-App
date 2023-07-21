import 'package:facetomini/data/models/session.dart';
import 'package:facetomini/domain/entities/app.dart';

/// Transformation of the 'raw' models in the entities used
abstract final class EntitiesMapper {
  //
  static SessionEntity? authorizedMapper(SessionModel? model) {
    if (model == null) return null;
    return SessionEntity(
      idApp: model.idApp,
      enabledSound: model.enabledSound,
      locale: model.language,
      theme: model.theme,
    );
  }
}
