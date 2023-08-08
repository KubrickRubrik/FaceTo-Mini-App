import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/data/models/dto/dto.dart';

final class WinnersDTO extends Dto {
  final int idSource;
  final TypeWinnersSource type;
  final int idLast;

  WinnersDTO({
    required this.idSource,
    required this.type,
    this.idLast = 0,
  });

  @override
  Map<String, dynamic> toMapRequest() {
    return {
      "action": super.actionApi,
      "data": {
        "id": idSource,
        "id_last": idLast,
      },
    };
  }
}
