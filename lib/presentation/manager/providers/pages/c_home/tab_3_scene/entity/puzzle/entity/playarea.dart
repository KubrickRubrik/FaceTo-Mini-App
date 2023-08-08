part of '../puzzle.dart';

final class _PlayArea {
  final durationAnimation = DurationShiftAnimation();
  final paddingPlayArea = 5;
  final aspectRation = 0.8;
  // Cell visual constraints
  final cellRoundingRadius = 8.0;
  final cellPadding = 0.6;
  //
  final grid = _GridPuzzle();
  double aScale = 0.0;

  /// Working window size
  final sizePlayArea = _SizePlayArea();
  final sizeCell = _SizeCell();

  /// Correction and adjustment of the size of the playing field and cells at the start of the game
  void adjustmentSize() {
    // Adjusting the size of the playing field
    final wBar = ConfigNumbers.getNumRound(sizePlayArea.widthPlayArea - paddingPlayArea);
    final hBar = ConfigNumbers.getNumRound(wBar / aspectRation);
    sizePlayArea.adjustment(width: wBar, height: hBar);
    // Setting the dimensions of the matrix cell
    final wCell = ConfigNumbers.getNumRound(wBar / grid.xCountCells);
    final hCell = ConfigNumbers.getNumRound(hBar / grid.yCountCells);
    sizeCell.adjustment(width: wCell, height: hCell);
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

  void adjustment({required double width, required double height}) {
    widthPlayArea = width;
    heightPlayArea = height;
  }

  Size getSize() {
    return Size(widthPlayArea, heightPlayArea);
  }
}

/// Class for the size of cell
final class _SizeCell {
  // Size of screen
  double widthCell = 0;
  double heightCell = 0;
  double maxHelperSize = 0;

  void adjustment({required double width, required double height}) {
    widthCell = width;
    heightCell = height;
    maxHelperSize = min(width, height) * 0.8;
  }
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
