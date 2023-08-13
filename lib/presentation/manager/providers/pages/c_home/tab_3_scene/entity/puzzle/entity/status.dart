part of '../puzzle.dart';

/// Class for storing and changing puzzle statuses
final class _StatusPuzzle {
  /// Puzzle Content loading status
  var statusLoadingGame = StatusContent.isLoadContent; // Displays game loading message
  /// Status to keep track of the state of the ability to swipe the puzzle
  var isAvailableSwipe = true; // true - can swipe
  /// Hint display tracking and the prohibition to run the
  /// tooltip more than once in a certain period of time
  var isDisplayHelperPuzzle = true; // true - can restart the hint

  void setGameLaunchState() {
    statusLoadingGame = StatusContent.isLoadContent;
    isAvailableSwipe = true;
    isDisplayHelperPuzzle = false;
  }

  /// Setting the run status of a shift
  void runShift() {
    isAvailableSwipe = false;
    statusLoadingGame = StatusContent.isViewContent;
  }

  /// Setting the complete status of a shift
  void completeShift() => isAvailableSwipe = true;

  /// Check display helper puzzle
  bool get isDisplayHelper => isDisplayHelperPuzzle == false;

  void displayHelper(bool display) => isDisplayHelperPuzzle = display;
}
