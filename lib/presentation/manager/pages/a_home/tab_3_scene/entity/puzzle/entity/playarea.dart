part of '../puzzle.dart';

final class _PlayArea {
  /// Puzzle animation duration
  final durationFullAnimation = 200; // 600;
  final durationDiagonalAnimation = 300; //1200;
  final paddingPlayArea = 5;
  final aspectRation = 0.8;
  //
  // final radItem = 8.0;
  // final paddItem = 0.6;
  final grid = _GridPuzzle();
  double aScale = 0.0;

  /// Working window size
  final sizePlayArea = _SizePlayArea();
  final sizeCell = _SizeCell();

  ///
  final diagonalConstraints = _DiagonalShiftConstraints();

  void adjustmentSize() {
    sizePlayArea.widthPlayArea = double.parse((sizePlayArea.widthPlayArea - paddingPlayArea).toStringAsFixed(2));
    sizePlayArea.heightPlayArea = double.parse((sizePlayArea.widthPlayArea / aspectRation).toStringAsFixed(2));
    sizeCell.widthCell = double.parse((sizePlayArea.widthPlayArea / grid.xCountCells).toStringAsFixed(2));
    sizeCell.heightCell = double.parse((sizeCell.heightCell / grid.yCountCells).toStringAsFixed(2));
  }
}

/// Class for the size of the working window of the application
final class _SizePlayArea {
  // Size of screen
  double widthPlayArea = 0;
  double heightPlayArea = 0;

  /// Set default parameters
  void setDefaultParameters({required double w, required double h}) {
    widthPlayArea = w;
    heightPlayArea = h;
  }
}

/// Class for the size of cell
final class _SizeCell {
  // Size of screen
  double widthCell = 0;
  double heightCell = 0;
}

/// Class for storing scene grid data
final class _GridPuzzle {
  int xCountCells = 3;
  int yCountCells = 3;
  int square = 9;

  void set({required int xCells, required int yCells}) {
    xCountCells = xCells;
    yCountCells = yCells;
    square = xCountCells * yCountCells;
  }
}

///
final class _DiagonalShiftConstraints {
  /// Maximum angle below which a diagonal swipe will be identified
  int maxAngleDiagonalSwipe = 1;

  /// The minimum angle above which a diagonal swipe will be identified
  int minAngleDiagonalSwipe = 0;

  /// Sets the range in which the swipe will be identified as diagonal
  final rangeIdentDiagonalSwipe = 15;

  set(({int maxAngle, int minAnle}) data) {
    maxAngleDiagonalSwipe = data.maxAngle;
    minAngleDiagonalSwipe = data.minAnle;
  }
}
