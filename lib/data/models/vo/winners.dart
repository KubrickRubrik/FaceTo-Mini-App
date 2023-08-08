final class WinnersModel {
  final List<ChampionsModel> listWinner;
  final StatAllChampionsModel? stat;
  WinnersModel(Map<String, dynamic> data)
      : listWinner = _makeListWinner(data['winners']),
        stat = StatAllChampionsModel(data['stat']);

  // Make winners
  static List<ChampionsModel> _makeListWinner(List<dynamic>? data) {
    if (data == null) return [];
    return data.map((winner) {
      return ChampionsModel(winner);
    }).toList();
  }
}

final class ChampionsModel {
  final int idApp;
  final String nick;
  final String logo;
  final StatChampionModel stat;

  ChampionsModel(Map<String, dynamic> data)
      : idApp = data['id_app'],
        nick = data['nick'],
        logo = data['logo'],
        stat = StatChampionModel(data['stat']);
}

final class StatChampionModel {
  final int position;
  final int time;
  final int xp;

  StatChampionModel(Map<String, dynamic> data)
      : position = data['pos'],
        time = data['time'],
        xp = data['xp'];
}

final class StatAllChampionsModel {
  final MinMidMaxModel min;
  final MinMidMaxModel mid;
  final MinMidMaxModel max;
  final GraphModel graph;

  StatAllChampionsModel(Map<String, dynamic> data)
      : min = MinMidMaxModel(
          swipe: double.parse(data['time_swipe']['min']['swipe'].toString()),
          time: data['time_swipe']['min']['time'],
        ),
        mid = MinMidMaxModel(
          swipe: double.parse(data['time_swipe']['mid']['swipe'].toString()),
          time: data['time_swipe']['mid']['time'],
        ),
        max = MinMidMaxModel(
          swipe: double.parse(data['time_swipe']['max']['swipe'].toString()),
          time: data['time_swipe']['max']['time'],
        ),
        graph = GraphModel(data['graph']);
}

final class MinMidMaxModel {
  final double swipe;
  final int time;

  MinMidMaxModel({
    required this.swipe,
    required this.time,
  });
}

final class GraphModel {
  final int countUsersMin;
  final int countUsersMax;
  final int countUsers;
  final UserGraphStatModel userStat;
  final int userCountSwipe;
  final GAxisModel xAxis;
  final GAxisModel yAxis;

  GraphModel(Map<String, dynamic> data)
      : countUsersMin = data['count_users_min'],
        countUsersMax = data['count_users_max'],
        countUsers = data['count_users'],
        userStat = UserGraphStatModel(
          userState: data['user']['state'],
          userTime: data['user']['time'],
          userCountSwipe: data['count_users'],
        ),
        userCountSwipe = data['user']['count_swipe'],
        xAxis = GAxisModel(data['scale_rate']['x_axis']),
        yAxis = GAxisModel(data['scale_rate']['y_axis']);
}

final class UserGraphStatModel {
  final int userState;
  final int userTime;
  final int userCountSwipe;

  UserGraphStatModel({
    required this.userState,
    required this.userTime,
    required this.userCountSwipe,
  });
}

final class GAxisModel {
  final int interval;
  final int minLimit;
  final int maxLimit;

  GAxisModel(Map<String, dynamic> data)
      : interval = data['interval'],
        minLimit = data['limits'][0],
        maxLimit = data['limits'][1];
}
