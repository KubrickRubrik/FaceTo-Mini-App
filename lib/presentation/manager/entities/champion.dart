import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';

class ChampionData {
  int idApp = 0;
  String nick = '';
  final image = ImageWinner();
  int pos = 0;
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
    pos = data.stat.position;
    time = data.stat.time;
    xp = data.stat.xp;
    image.setLogo(data.logo);
    toNextTime = time - toNextTime;
    _diff = toLastTime - time;
    toLastTime = (_diff > 0) ? _diff : 0;
  }

  void clear() {
    idApp = 0;
    nick = '';
    image.clear();
    pos = 0;
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
    logo = '';
  }

  void clear() {
    logo = '';
  }
}
