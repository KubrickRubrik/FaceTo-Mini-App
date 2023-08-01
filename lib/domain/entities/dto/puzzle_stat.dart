import 'package:facetomini/data/models/dto/dto.dart';

/// A class for transferring data between layers `Presentation` -> `Domain` -> `Data`
/// The class is used to get puzzle statistics data
final class PuzzleDataDTO extends Dto {
  final int idSeries;
  final int idScene;
  final int timeUser;
  final int timeRecord;

  PuzzleDataDTO({
    required this.idSeries,
    required this.idScene,
    required this.timeUser,
    required this.timeRecord,
  });

  @override
  Map<String, dynamic> toMapRequest() {
    return {
      "action": super.actionApi,
      "data": {
        "id_series": idSeries,
        "id_scene": idScene,
        "time": timeUser,
      },
    };
  }
}
