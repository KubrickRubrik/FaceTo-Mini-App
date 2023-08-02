part of '../../puzzle.dart';

/// Class for calculating cell shift data in a puzzle matrix
abstract final class _ActionShift with _DefinitionCells, _PerfomanceShift, _RelocationCells, _UpdatesCells {
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

  /// Relocation a cell after shift
  static void relocationCell({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required _GridPuzzle grid,
  }) {
    switch (shiftedCells.swipe.axis) {
      case TypeAxisSwipe.horisontal:
        _RelocationCells.horizontalRelocation(
          shiftedCells: shiftedCells,
          cells: cells,
          sizeCell: sizeCell,
          grid: grid,
        );
        break;
      case TypeAxisSwipe.vertical:
        _RelocationCells.verticalRelocation(
          shiftedCells: shiftedCells,
          cells: cells,
          sizeCell: sizeCell,
          grid: grid,
        );
        break;
      case TypeAxisSwipe.diagonal:
        _RelocationCells.diagonalRelocation(
          shiftedCells: shiftedCells,
          cells: cells,
          sizeCell: sizeCell,
          grid: grid,
        );
        break;
    }
  }

  /// Updating the image of all additional cells;
  static void updateAdditionCell({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _GridPuzzle grid,
  }) {
    // Performing a pass through all additional cells to change
    // their image characteristics after the puzzle has been shifted
    for (ViewCell cell in shiftedCells.listMainShiftCells) {
      //? Updating additional cells on top
      _UpdatesCells.updateTopAdditionCells(
        shiftedCells: shiftedCells,
        shiftedCell: cell,
        cells: cells,
        grid: grid,
      );
      //? Updating additional cells on bottom
      _UpdatesCells.updateBottomAdditionCells(
        shiftedCells: shiftedCells,
        shiftedCell: cell,
        cells: cells,
        grid: grid,
      );
      //? Updating additional cells on left
      _UpdatesCells.updateLeftAdditionCells(
        shiftedCells: shiftedCells,
        shiftedCell: cell,
        cells: cells,
        grid: grid,
      );
      //? Updating additional cells on right
      _UpdatesCells.updateRightAdditionCells(
        shiftedCells: shiftedCells,
        shiftedCell: cell,
        cells: cells,
      );
      //? Updating additional cells on left-handed diagonal '\'
      _UpdatesCells.updateLeftDiagonalAdditionCells(
        shiftedCells: shiftedCells,
        shiftedCell: cell,
        cells: cells,
      );
      //? Updating additional cells on right-handed diagonal '/'
      _UpdatesCells.updateRightDiagonalAdditionCells(
        shiftedCells: shiftedCells,
        shiftedCell: cell,
        cells: cells,
      );
    }
    // Performing relocation of an additional cell, which,
    // after shifting the puzzle, was in the player's field of vision
    shiftedCells.additionalShiftCell?.toHome();
  }

  //. Forming a combination of puzzle cells to check the winning combination
  static List<int> formatingCellKeysCombination({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
  }) {
    final listCombinationKeys = <ViewCell>[];
    //
    for (ViewCell cell in cells.listMainCell) {
      if (listCombinationKeys.isEmpty) {
        listCombinationKeys.add(cell);
        continue;
      }
      if (cell.idPositionCell < listCombinationKeys.first.idPositionCell) {
        listCombinationKeys.insert(0, cell);
      } else if (cell.idPositionCell > listCombinationKeys.last.idPositionCell) {
        listCombinationKeys.add(cell);
      } else {
        for (var i = 0; i < listCombinationKeys.length; i++) {
          if (listCombinationKeys.elementAt(i).idPositionCell < cell.idPositionCell &&
              cell.idPositionCell < listCombinationKeys.elementAt(i + 1).idPositionCell) {
            listCombinationKeys.insert(i + 1, cell);
            break;
          }
        }
      }
    }
    //
    return listCombinationKeys.map((e) => e.keyCell).toList();
  }
}
