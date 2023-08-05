import 'package:facetomini/data/api/core/database/config/connect.dart';

final class PuzzleUpdatesModel {
  final SeiresPuzzleUpdatesModel series;
  final ScenePuzzleUpdatesModel scene;
  final WinnerPuzzleUpdatesModel winner;
  final ViewUserPuzzleUpdatesModel viewUser;

  PuzzleUpdatesModel(Map<String, dynamic> data)
      : series = SeiresPuzzleUpdatesModel(
          idSeires: data['update']['series']['id_series'],
          time: data['update']['series']['time'],
          xp: data['update']['series']['xp'],
          completed: data['update']['series']['completed'],
          ratingSeries: double.parse("${data['update']['series']['rating']}"),
          countUsersRating: data['update']['series']['count_users_rating'],
          countUsers: data['update']['series']['count_users'],
        ),
        scene = ScenePuzzleUpdatesModel(
          idScene: data['update']['scene']['id_scene'],
          time: data['update']['scene']['time'],
          xp: data['update']['scene']['xp'],
          completed: data['update']['scene']['completed'],
          countUsers: data['update']['scene']['count_users'],
          recordTime: data['update']['scene']['record_time'],
        ),
        winner = WinnerPuzzleUpdatesModel(
          idApp: data['winner_user']['id_app'],
          nick: data['winner_user']['nick'],
          logo: data['winner_user']['logo'],
          stat: StatWinnerPuzzleUpdatesModel(
            position: data['winner_user']['stat']['pos'],
            time: data['winner_user']['stat']['time'],
            xp: data['winner_user']['stat']['xp'],
          ),
        ),
        viewUser = ViewUserPuzzleUpdatesModel(
          idApp: data['view_user']['id_app'],
          nick: data['view_user']['nick'],
          logo: data['view_user']['logo'],
          stat: StatViewUserPuzzleUpdatesModel(
            position: data['winner_user']['stat']['pos'],
            time: data['winner_user']['stat']['time'],
            xp: data['winner_user']['stat']['xp'],
            toNextTime: data['winner_user']['stat']['toNextTime'],
            toLastTime: data['winner_user']['stat']['toLastTime'],
          ),
        );

  PuzzleUpdatesModel.db({required TableSeries series, required TableScenes scene})
      : series = SeiresPuzzleUpdatesModel(
          idSeires: series.idSeries,
          time: series.bestTime,
          xp: series.xp,
          completed: series.completed,
          ratingSeries: series.ratingSeries,
          countUsersRating: series.countUsersRating,
          countUsers: series.countUsers,
        ),
        scene = ScenePuzzleUpdatesModel(
          idScene: scene.idScene,
          time: scene.recordTime,
          xp: scene.xp,
          completed: scene.completed,
          countUsers: scene.countUsers,
          recordTime: scene.recordTime,
        ),
        winner = WinnerPuzzleUpdatesModel.empty(),
        viewUser = ViewUserPuzzleUpdatesModel.empty();
}

final class SeiresPuzzleUpdatesModel {
  final int idSeires;
  final int time;
  final int xp;
  final int completed;
  final double ratingSeries;
  final int countUsersRating;
  final int countUsers;

  SeiresPuzzleUpdatesModel({
    required this.idSeires,
    required this.time,
    required this.xp,
    required this.completed,
    required this.ratingSeries,
    required this.countUsersRating,
    required this.countUsers,
  });
}

final class ScenePuzzleUpdatesModel {
  final int idScene;
  final int time;
  final int xp;
  final int completed;
  final int countUsers;
  final int recordTime;

  ScenePuzzleUpdatesModel({
    required this.idScene,
    required this.time,
    required this.xp,
    required this.completed,
    required this.countUsers,
    required this.recordTime,
  });
}

final class WinnerPuzzleUpdatesModel {
  final int idApp;
  final String nick;
  final String logo;
  final StatWinnerPuzzleUpdatesModel stat;

  WinnerPuzzleUpdatesModel({
    required this.idApp,
    required this.nick,
    required this.logo,
    required this.stat,
  });
  WinnerPuzzleUpdatesModel.empty()
      : idApp = 0,
        nick = '',
        logo = '',
        stat = StatWinnerPuzzleUpdatesModel.empty();
}

final class StatWinnerPuzzleUpdatesModel {
  final int position;
  final int time;
  final int xp;

  StatWinnerPuzzleUpdatesModel({
    required this.position,
    required this.time,
    required this.xp,
  });
  StatWinnerPuzzleUpdatesModel.empty()
      : position = 0,
        time = 0,
        xp = 0;
}

final class ViewUserPuzzleUpdatesModel {
  final int idApp;
  final String nick;
  final String logo;
  final StatViewUserPuzzleUpdatesModel stat;

  ViewUserPuzzleUpdatesModel({
    required this.idApp,
    required this.nick,
    required this.logo,
    required this.stat,
  });

  ViewUserPuzzleUpdatesModel.empty()
      : idApp = 0,
        nick = '',
        logo = '',
        stat = StatViewUserPuzzleUpdatesModel.empty();
}

final class StatViewUserPuzzleUpdatesModel {
  final int position;
  final int time;
  final int xp;
  final int? toNextTime;
  final int? toLastTime;

  StatViewUserPuzzleUpdatesModel({
    required this.position,
    required this.time,
    required this.xp,
    required this.toNextTime,
    required this.toLastTime,
  });
  StatViewUserPuzzleUpdatesModel.empty()
      : position = 0,
        time = 0,
        xp = 0,
        toNextTime = 0,
        toLastTime = 0;
}
