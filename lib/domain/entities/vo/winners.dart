final class WinnersEntity {
  final List<ChampionsEntity> listWinner;
  final StatAllChampionsEntity? stat;

  WinnersEntity({required this.listWinner, required this.stat});
}

final class ChampionsEntity {
  final int idApp;
  final String nick;
  final String logo;
  final StatChampionEntity stat;

  ChampionsEntity({
    required this.idApp,
    required this.nick,
    required this.logo,
    required this.stat,
  });
}

final class StatChampionEntity {
  final int position;
  final int time;
  final int xp;

  StatChampionEntity({
    required this.position,
    required this.time,
    required this.xp,
  });
}

final class StatAllChampionsEntity {
  final MinMidMaxEntity min;
  final MinMidMaxEntity mid;
  final MinMidMaxEntity max;
  final GraphEntity graph;

  StatAllChampionsEntity({
    required this.min,
    required this.mid,
    required this.max,
    required this.graph,
  });
}

final class MinMidMaxEntity {
  final double swipe;
  final int time;

  MinMidMaxEntity({
    required this.swipe,
    required this.time,
  });
}

final class GraphEntity {
  final int countUsersMin;
  final int countUsersMax;
  final int countUsers;
  final UserGraphStatEntity userStat;
  final int userCountSwipe;
  final GAxisEntity xAxis;
  final GAxisEntity yAxis;
  final int flexLeft;
  final int flexRight;

  GraphEntity({
    required this.countUsersMin,
    required this.countUsersMax,
    required this.countUsers,
    required this.userStat,
    required this.userCountSwipe,
    required this.xAxis,
    required this.yAxis,
    required this.flexLeft,
    required this.flexRight,
  });
}

final class UserGraphStatEntity {
  final int userState;
  final int userTime;
  final int userCountSwipe;

  UserGraphStatEntity({
    required this.userState,
    required this.userTime,
    required this.userCountSwipe,
  });
}

final class GAxisEntity {
  final int interval;
  final int minLimit;
  final int maxLimit;

  GAxisEntity({
    required this.interval,
    required this.minLimit,
    required this.maxLimit,
  });
}
