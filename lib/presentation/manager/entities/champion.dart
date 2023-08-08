import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';

<<<<<<< HEAD:lib/presentation/manager/entities/champion.dart
class ChampionData {
=======
final class WinnerOnline {
  final winnerRecordUser = UserRecordsData();
  final winnerViewUser = UserRecordsData();

  setWinner(PuzzleUpdatesEntity data) {
    // data.winner.logo
    winnerRecordUser.set(
      data: data.winner,
      toNextTime: data.winner.stat.time,
      toLastTime: data.winner.stat.time,
    );
    winnerViewUser.set(
      data: data.viewUser,
      toNextTime: data.viewUser.stat.toNextTime,
      toLastTime: data.viewUser.stat.toLastTime,
    );
  }

  void clear() {
    winnerRecordUser.clear();
    winnerViewUser.clear();
  }
}

class UserRecordsData {
>>>>>>> develop:lib/presentation/manager/pages/a_home/tab_3_scene/entity/winner/entity/data/entity/online.dart
  int idApp = 0;
  String nick = '';
  final image = ImageWinner();
  int position = 0;
  int xp = 0;
  int time = 0;
  int toNextTime = 0;
  int toLastTime = 0;
  int _diff = 0;

  void set({
    required WinnerPuzzleUpdatesEntity data,
    required int toNextTime,
    required int toLastTime,
  }) {
    idApp = data.idApp;
    nick = data.nick;
    position = data.stat.position;
    time = data.stat.time;
    xp = data.stat.xp;
    image.setLogo(data.logo);
    this.toNextTime = time - toNextTime;
    _diff = toLastTime - time;
    this.toLastTime = (_diff > 0) ? _diff : 0;
  }

  void clear() {
    idApp = 0;
    nick = '';
    image.clear();
    position = 0;
    xp = 0;
    time = 0;
    toNextTime = 0;
    toLastTime = 0;
    _diff = 0;
  }
}

class ImageWinner {
  String logo = '';
  var typeOriginLogo = TypeSourceImage.server;

  void setLogo(String logo) {
    this.logo = logo;
  }

  void clear() {
    logo = '';
  }
}
