part of '../winners.dart';

final class _Winners {
  final listWinners = <ChampionData>[];
  final winnerUser = ChampionData();
  final stat = InfoStatData();

  // Adding winner data and puzzle statistics.
  void set(WinnersEntity data) {
    _clear();
    //? Set winners
    _addWinners(data);
    //? Set stata
    stat.set(data.stat!);
  }

  // Method to add winners when scrolling.
  void addScrollList(WinnersEntity data) {
    _addWinners(data);
  }

  // Method for adding winners.
  void _addWinners(WinnersEntity data) {
    final lengthNewListChampions = data.listWinner.length;
    for (var i = 0, j = 1; i < data.listWinner.length; i++, j++) {
      final champion = data.listWinner[i];
      final nextChampion = (j < lengthNewListChampions) ? data.listWinner[j] : null;
      final times = _separationTimeFormation(
        index: i,
        lengthNewListChampions: lengthNewListChampions,
        listMainWinners: listWinners,
        champion: champion,
        nextChampion: nextChampion,
      );
      listWinners.add(
        ChampionData()
          ..set(
            data: WinnerPuzzleUpdatesEntity(
              idApp: champion.idApp,
              nick: champion.nick,
              logo: champion.logo,
              stat: StatWinnerPuzzleUpdatesEntity(
                position: champion.stat.position,
                time: champion.stat.time,
                xp: champion.stat.xp,
              ),
            ),
            toNextTime: times.toNextTime,
            toLastTime: times.toLastTime,
          ),
      );
    }
  }

  // Formation of lag and lead time indicators for the current user (next and previous).
  ({int toNextTime, int toLastTime}) _separationTimeFormation({
    required int index,
    required int lengthNewListChampions,
    required List<ChampionData> listMainWinners,
    required ChampionsEntity champion,
    required ChampionsEntity? nextChampion,
  }) {
    int nextTime = 0;
    int lastTime = 0;
    //? Update data for previous item
    if (listMainWinners.isNotEmpty && index == 0) {
      listMainWinners.last.toLastTime = champion.stat.time - listMainWinners.last.time;
    }
    //? Previous
    if (listMainWinners.isNotEmpty) {
      nextTime = listMainWinners.first.time;
    } else {
      nextTime = 0;
    }
    //? Subsequent
    if (nextChampion != null) {
      lastTime = nextChampion.stat.time;
    } else {
      lastTime = 0;
    }
    if (listMainWinners.isEmpty) nextTime = champion.stat.time;
    //
    return (toNextTime: nextTime, toLastTime: lastTime);
  }

  void _clear() {
    listWinners.clear();
    winnerUser.clear();
  }
}
