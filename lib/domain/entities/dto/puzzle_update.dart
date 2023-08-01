import 'package:facetomini/data/models/dto/dto.dart';

final class PuzzleUpdateDTO extends Dto {
  final SeriesPuzzleUpdate series;
  final ScenePuzzleUpdate scene;

  PuzzleUpdateDTO({
    required this.series,
    required this.scene,
  });

  @override
  Map<String, dynamic> toMapRequest() {
    return {};
  }
}

final class SeriesPuzzleUpdate {
  final int idSeries;
  final int xp;
  final int completed;
  final double ratingSeries;
  final int countUsersRating;

  SeriesPuzzleUpdate({
    required this.idSeries,
    required this.xp,
    required this.completed,
    required this.ratingSeries,
    required this.countUsersRating,
  });
}

final class ScenePuzzleUpdate {
  final int idScene;
  final int xp;
  final int completed;
  final int recordTime;
  final int countUsers;

  ScenePuzzleUpdate({
    required this.idScene,
    required this.xp,
    required this.completed,
    required this.recordTime,
    required this.countUsers,
  });
}
