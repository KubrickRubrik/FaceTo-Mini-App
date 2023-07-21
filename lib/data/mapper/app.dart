import 'package:facetomini/data/models/app.dart';
import 'package:facetomini/domain/entities/app.dart';

/// Transformation of the 'raw' models in the entities used
abstract final class EntitiesMapper {
  //
  static AuhtorizedEntity? authorizedMapper(AuthorizedModel? model) {
    if (model == null) return null;
    return AuhtorizedEntity(
      idApp: model.idApp,
      enabledSound: model.enabledSound,
      locale: model.language,
      theme: model.theme,
    );
  }
}
