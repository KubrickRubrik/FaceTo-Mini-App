import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/data/models/dto/dto.dart';

final class WinnersDTO extends Dto {
  final int idSource;
  final TypeWinnersSource type;

  WinnersDTO({
    required this.idSource,
    required this.type,
  });

  @override
  Map<String, dynamic> toMapRequest() {
    return {
      'id': idSource,
    };
  }
}
