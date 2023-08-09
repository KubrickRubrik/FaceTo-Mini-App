part of '../controller.dart';

/// Class for storing and displaying online data of winners.
/// 1. Used to display the winners after solving a puzzle.
/// 2. Used to display winners after requesting winners on a
/// [PageTabScenes] or [PageTabSeries] page
final class WinnerOnline {
  final winnerRecordUser = ChampionData();
  final winnerViewUser = ChampionData();

  setWinner(PuzzleUpdatesEntity data) {
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
