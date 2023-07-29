part of '../puzzle.dart';

final class _StatusPuzzle {
  /// Puzzle Content loading status
  var statusLoadingGame = StatusContent.isLoadContent; // Displays game loading message
  /// Status to keep track of the state of the ability to swipe the puzzle
  var isPossibleSwipe = true; // true - can swipe
  /// Hint display tracking and the prohibition to run the
  /// tooltip more than once in a certain period of time
  var isDisplayHelpHint = true; // true - can restart the hint

  void setGameLaunchState() {
    statusLoadingGame = StatusContent.isLoadContent;
    isPossibleSwipe = true;
    isDisplayHelpHint = true;
  }
}
