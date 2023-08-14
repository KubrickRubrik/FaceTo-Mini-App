final class PuzzleUpdatesEntity {
  var isOnline = false; // Displays the data source
  final SeriesPuzzleUpdatesEntity series;
  final ScenePuzzleUpdatesEntity scene;
  final WinnerPuzzleUpdatesEntity winner;
  final WinnerPuzzleUpdatesEntity viewUser;

  PuzzleUpdatesEntity({
    required this.series,
    required this.scene,
    required this.winner,
    required this.viewUser,
  });
}

final class SeriesPuzzleUpdatesEntity {
  int idSeires;
  final int timeRecord;
  final int xp;
  int completed;
  final double ratingSeries;
  final int countUsersRating;
  final int countUsers;

  SeriesPuzzleUpdatesEntity({
    required this.idSeires,
    required this.timeRecord,
    required this.xp,
    required this.completed,
    required this.ratingSeries,
    required this.countUsersRating,
    required this.countUsers,
  });
}

final class ScenePuzzleUpdatesEntity {
  int idScene;
  final int time;
  final int xp;
  int completed;
  final int countUsers;
  int recordTime;

  ScenePuzzleUpdatesEntity({
    required this.idScene,
    required this.time,
    required this.xp,
    required this.completed,
    required this.countUsers,
    required this.recordTime,
  });
}

final class WinnerPuzzleUpdatesEntity {
  final int idApp;
  final String nick;
  final String logo;
  final StatWinnerPuzzleUpdatesEntity stat;

  WinnerPuzzleUpdatesEntity({
    required this.idApp,
    required this.nick,
    required this.logo,
    required this.stat,
  });
}

final class StatWinnerPuzzleUpdatesEntity {
  final int position;
  final int time;
  final int xp;
  final int toNextTime;
  final int toLastTime;

  StatWinnerPuzzleUpdatesEntity({
    required this.position,
    required this.time,
    required this.xp,
    this.toNextTime = 0,
    this.toLastTime = 0,
  });
}
