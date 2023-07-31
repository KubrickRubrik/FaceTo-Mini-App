part of '../puzzle.dart';

final class _SwipePuzzle {
  /// Diagonal swipe performance limitation
  final diagonalConstraints = _DiagonalSwipeConstraints();

  /// Storing and setting the start and end coordinates of a swipe
  final coord = _SwipeCoordinates();
}

///
final class _DiagonalSwipeConstraints {
  /// Maximum angle below which a diagonal swipe will be identified
  int maxAngleDiagonalSwipe = 1;

  /// The minimum angle above which a diagonal swipe will be identified
  int minAngleDiagonalSwipe = 0;

  /// Sets the range in which the swipe will be identified as diagonal
  final rangeIdentDiagonalSwipe = 15;

  void set(({int maxAngle, int minAnle}) data) {
    maxAngleDiagonalSwipe = data.maxAngle;
    minAngleDiagonalSwipe = data.minAnle;
  }
}

///
final class _SwipeCoordinates {
  final startCoord = _DataCoord();
  final endCoord = _DataCoord();

  /// Setting the initial coordinates of the swipe
  setStartCoord(Offset offset) {
    startCoord.set(offset);
  }

  /// Setting the end coordinates of the swipe
  setEndCoord(Offset offset) {
    startCoord.set(offset);
  }

  /// Rounding to a certain precision
  double getNumRound(double num) => double.parse(num.toStringAsFixed(2));
}

final class _DataCoord {
  double coordX = 0;
  double coordY = 0;

  set(Offset data) {
    coordX = ConfigNumbers.getNumRound(data.dx);
    coordY = ConfigNumbers.getNumRound(data.dy);
  }
}
