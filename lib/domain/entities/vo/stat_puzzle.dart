final class PuzzleUpdatesEntity {
  final SeriesPuzzleUpdatesEntity series;
  final ScenePuzzleUpdatesEntity scene;
  final WinnerPuzzleUpdatesEntity winner;
  final ViewUserPuzzleUpdatesEntity viewUser;

  PuzzleUpdatesEntity({
    required this.series,
    required this.scene,
    required this.winner,
    required this.viewUser,
  });

  PuzzleUpdatesEntity.empty()
      : series = SeriesPuzzleUpdatesEntity.empty(),
        scene = ScenePuzzleUpdatesEntity.empty(),
        winner = WinnerPuzzleUpdatesEntity.empty(),
        viewUser = ViewUserPuzzleUpdatesEntity.empty();
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
  SeriesPuzzleUpdatesEntity.empty()
      : idSeires = 0,
        timeRecord = 0,
        xp = 0,
        completed = -1,
        ratingSeries = 0,
        countUsersRating = 0,
        countUsers = 0;
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

  ScenePuzzleUpdatesEntity.empty()
      : idScene = 0,
        time = 0,
        xp = 0,
        completed = 0,
        countUsers = 0,
        recordTime = 0;
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
  WinnerPuzzleUpdatesEntity.empty()
      : idApp = 0,
        nick = '',
        logo = '',
        stat = StatWinnerPuzzleUpdatesEntity.empty();
}

final class StatWinnerPuzzleUpdatesEntity {
  final int position;
  final int time;
  final int xp;

  StatWinnerPuzzleUpdatesEntity({
    required this.position,
    required this.time,
    required this.xp,
  });
  StatWinnerPuzzleUpdatesEntity.empty()
      : position = 0,
        time = 0,
        xp = 0;
}

final class ViewUserPuzzleUpdatesEntity {
  final int idApp;
  final String nick;
  final String logo;
  final StatViewUserPuzzleUpdatesEntity stat;

  ViewUserPuzzleUpdatesEntity({
    required this.idApp,
    required this.nick,
    required this.logo,
    required this.stat,
  });
  ViewUserPuzzleUpdatesEntity.empty()
      : idApp = 0,
        nick = '',
        logo = '',
        stat = StatViewUserPuzzleUpdatesEntity.empty();
}

final class StatViewUserPuzzleUpdatesEntity {
  final int position;
  final int time;
  final int xp;
  final int? toNextTime;
  final int? toLastTime;

  StatViewUserPuzzleUpdatesEntity({
    required this.position,
    required this.time,
    required this.xp,
    required this.toNextTime,
    required this.toLastTime,
  });
  StatViewUserPuzzleUpdatesEntity.empty()
      : position = 0,
        time = 0,
        xp = 0,
        toNextTime = 0,
        toLastTime = 0;
}

// final class UpdatedSeriesData {
//   // final int idSeries;

//   // final int timeGame;

//   int idScene = 0;
//   int sceneTime = 0; // время прохождения сцен для сравнивания с recordTime
//   //
//   double rating = 0; // Рейтинг серии
//   int countUserRating = 0; // Количество пользователей, что проставили рейтинг серии
//   //
//   int xp = 0;
//   int completed = -1;
//   int countUsers = 0;
//   int recordTime = 0; // лучшее время, установленое пользователями из базы данных после заверщения сцены
// }

// final class UpdatedSceneData {
//   int idScene = 0;
//   int idSeries = 0;
//   int sceneTime = 0; // время прохождения сцен для сравнивания с recordTime
//   //
//   double rating = 0; // Рейтинг серии
//   int countUserRating = 0; // Количество пользователей, что проставили рейтинг серии
//   //
//   int xp = 0;
//   int completed = -1;
//   int countUsers = 0;
//   int recordTime = 0; // лучшее время, установленое пользователями из базы данных после заверщения сцены
// }
