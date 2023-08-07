part of '../controller.dart';

/// Class for displaying the data of the winner if there is no internet connection
final class WinnerOffline {
  int timeRecord = 0;
  int timeUser = 0;
  int diffTime = 0;
  bool get isNewRecord => diffTime < 0;
  int placesUser = 1;

  setWinner(PuzzleDataDTO puzzleData) {
    timeRecord = puzzleData.timeRecord;
    timeUser = puzzleData.timeUser;
    diffTime = timeUser - timeRecord;
    if (diffTime < 0) {
      placesUser = 1;
    } else if (diffTime == 0) {
      placesUser = 2;
    } else {
      placesUser = (diffTime / 5000).round();
      if (placesUser == 0) placesUser = 2;
    }
  }

  void clear() {
    timeRecord = 0;
    timeUser = 0;
    diffTime = 0;
    placesUser = 1;
  }
}
