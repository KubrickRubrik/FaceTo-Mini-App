import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/dto/puzzle_stat.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';

part 'entity/online.dart';
part 'entity/offline.dart';

/// Class for displaying data of winners if there is an internet connection
final class WinnerControllerData {
  bool isOnline = false;
  final online = WinnerOnline();
  final offline = WinnerOffline();

  void setWinner({
    required PuzzleUpdatesEntity updateData,
    required PuzzleDataDTO puzzleData,
  }) {
    online.clear();
    offline.clear();
    if (updateData.isOnline) {
      online.setWinner(updateData);
    } else {
      offline.setWinner(puzzleData);
    }
  }

  dynamic getWinner() {
    return switch (isOnline) {
      true => online,
      false => offline,
    };
  }
}
