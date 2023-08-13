part of '../../../puzzle.dart';

/// The class contains lists of additional cells that are outside the scope of the puzzle.
class AdditionalPuzzleCells {
  final listTopAdditionalCells = <ViewCell>[];
  final listRightAdditionalCells = <ViewCell>[];
  final listBottomAdditionalCells = <ViewCell>[];
  final listLeftAdditionalCells = <ViewCell>[];
  // Additional diagonal
  final additionalDiagonal = AdditionalDiagonal();

  void clear() {
    listTopAdditionalCells.clear();
    listRightAdditionalCells.clear();
    listBottomAdditionalCells.clear();
    listLeftAdditionalCells.clear();
    additionalDiagonal.clear();
  }
}

/// The class contains lists of additional cells that are outside the visible area of the puzzle
class AdditionalDiagonal {
  // Lists of left diagonals
  final listLeftTopAdditionalDiagonal = <ViewCell>[];
  final listRightBottomAdditionalDiagonal = <ViewCell>[];
  // Lists of right diagonals
  final listLeftBottomAdditionalDiagonal = <ViewCell>[];
  final listRightTopAdditionalDiagonal = <ViewCell>[];

  void clear() {
    listLeftTopAdditionalDiagonal.clear();
    listRightBottomAdditionalDiagonal.clear();
    listLeftBottomAdditionalDiagonal.clear();
    listRightTopAdditionalDiagonal.clear();
  }
}
