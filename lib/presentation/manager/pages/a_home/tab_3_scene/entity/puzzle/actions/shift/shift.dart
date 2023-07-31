part of '../../puzzle.dart';

/// Class for calculating cell shift data in a puzzle matrix
abstract final class _ActionShift with _DefinitionCells, _PerfomanceShift {
  /// Calculating cell data to be shifted
  static CellsDataShifted? shiftCellCalculation({
    required CellsDataShifted shiftedCells,
    required _SwipeCoordinates swipeCoord,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required int hardLevel,
    required _GridPuzzle grid,
  }) {
    return switch (shiftedCells.swipe.axis) {
      TypeAxisSwipe.horisontal => _DefinitionCells.horizontalSwipeData(
          shiftedCells: shiftedCells,
          swipeCoord: swipeCoord,
          cells: cells,
          grid: grid,
        ),
      TypeAxisSwipe.vertical => _DefinitionCells.verticalSwipeData(
          shiftedCells: shiftedCells,
          swipeCoord: swipeCoord,
          cells: cells,
          grid: grid,
        ),
      TypeAxisSwipe.diagonal => _DefinitionCells.diagonalSwipeData(
          shiftedCells: shiftedCells,
          swipeCoord: swipeCoord,
          cells: cells,
          sizeCell: sizeCell,
          hardLevel: hardLevel,
        ),
    };
  }

  /// Performing a shift for a different shift direction
  static void performShiftNow({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required DurationShiftAnimation durationAnimation,
    required _GridPuzzle grid,
  }) {
    switch (shiftedCells.swipe.axis) {
      case TypeAxisSwipe.horisontal:
        _PerfomanceShift.horizontalShift(
          shiftedCells: shiftedCells,
          cells: cells,
          sizeCell: sizeCell,
          durationAnimation: durationAnimation,
        );
        break;
      case TypeAxisSwipe.vertical:
        _PerfomanceShift.verticalShift(
          shiftedCells: shiftedCells,
          cells: cells,
          sizeCell: sizeCell,
          durationAnimation: durationAnimation,
          grid: grid,
        );
        break;
      case TypeAxisSwipe.diagonal:
        _PerfomanceShift.diagonalShift(
          shiftedCells: shiftedCells,
          cells: cells,
          sizeCell: sizeCell,
          durationAnimation: durationAnimation,
          grid: grid,
        );
        break;
    }
  }
}
