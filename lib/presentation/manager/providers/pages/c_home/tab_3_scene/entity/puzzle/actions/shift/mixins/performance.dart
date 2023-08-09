part of '../../../puzzle.dart';

mixin _PerfomanceShift {
  /// Perfomance of horizontal shift
  static void horizontalShift({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required DurationShiftAnimation durationAnimation,
  }) {
    if (shiftedCells.swipe.direction == DirectionSwipe.left) {
      // Swipe to left main cells
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllRows[shiftedCells.indexSectionShift].listItemCells.first) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listSectionsAllRows[shiftedCells.indexSectionShift].listItemCells.last;
        } else {
          cell.idPositionCell -= 1;
        }
        cell.xCoord -= sizeCell.widthCell;
        cell.duration = durationAnimation.durationSimpleAnimation;
      }
      //  Swipe additional cell
      shiftedCells.additionalShiftCell?.xCoord -= sizeCell.widthCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationSimpleAnimation;
    } else {
      // Swipe to right
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllRows.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listSectionsAllRows.elementAt(shiftedCells.indexSectionShift).listItemCells.first;
        } else {
          cell.idPositionCell += 1;
        }
        cell.xCoord += sizeCell.widthCell;
        cell.duration = durationAnimation.durationSimpleAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.xCoord += sizeCell.widthCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationSimpleAnimation;
    }
  }

  /// Perfomance of vertical shift
  static void verticalShift({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required DurationShiftAnimation durationAnimation,
    required _GridPuzzle grid,
  }) {
    if (shiftedCells.swipe.direction == DirectionSwipe.up) {
      // Swipe up
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(shiftedCells.indexSectionShift).listItemCells.last;
        } else {
          cell.idPositionCell -= grid.xCountCells;
        }
        cell.yCoord -= sizeCell.heightCell;
        cell.duration = durationAnimation.durationSimpleAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.yCoord -= sizeCell.heightCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationSimpleAnimation;
    } else {
      // Swipe down
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(shiftedCells.indexSectionShift).listItemCells.first;
        } else {
          cell.idPositionCell += grid.xCountCells;
        }
        cell.yCoord += sizeCell.heightCell;
        cell.duration = durationAnimation.durationSimpleAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.yCoord += sizeCell.heightCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationSimpleAnimation;
    }
  }

  /// Perfomance of diagonal shift
  static void diagonalShift({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required DurationShiftAnimation durationAnimation,
    required _GridPuzzle grid,
  }) {
    if (shiftedCells.swipe.direction == DirectionSwipe.upLeft) {
      //? Swipe upLeft
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listLeftDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listLeftDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.last;
        } else {
          cell.idPositionCell -= (grid.xCountCells + 1);
        }
        cell.xCoord -= sizeCell.widthCell;
        cell.yCoord -= sizeCell.heightCell;
        cell.duration = durationAnimation.durationDiagonalAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.xCoord -= sizeCell.widthCell;
      shiftedCells.additionalShiftCell?.yCoord -= sizeCell.heightCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationDiagonalAnimation;
    } else if (shiftedCells.swipe.direction == DirectionSwipe.downRight) {
      //? Swipe downLeft
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listLeftDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listLeftDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.first;
        } else {
          cell.idPositionCell += grid.xCountCells + 1;
        }
        cell.xCoord += sizeCell.widthCell;
        cell.yCoord += sizeCell.heightCell;
        cell.duration = durationAnimation.durationDiagonalAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.xCoord += sizeCell.widthCell;
      shiftedCells.additionalShiftCell?.yCoord += sizeCell.heightCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationDiagonalAnimation;
    } else if (shiftedCells.swipe.direction == DirectionSwipe.upRight) {
      //? Swipe upRight
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listRightDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listRightDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.last;
        } else {
          cell.idPositionCell -= (grid.xCountCells - 1);
        }
        cell.xCoord += sizeCell.widthCell;
        cell.yCoord -= sizeCell.heightCell;
        cell.duration = durationAnimation.durationDiagonalAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.xCoord += sizeCell.widthCell;
      shiftedCells.additionalShiftCell?.yCoord -= sizeCell.heightCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationDiagonalAnimation;
    } else {
      //? Swipe downRight
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listRightDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.idPositionCell = cells.sectionsDataPuzzle.listRightDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.first;
        } else {
          cell.idPositionCell += (grid.xCountCells - 1);
        }
        cell.xCoord -= sizeCell.widthCell;
        cell.yCoord += sizeCell.heightCell;
        cell.duration = durationAnimation.durationDiagonalAnimation;
      }
      // Swipe additional cell
      shiftedCells.additionalShiftCell?.xCoord -= sizeCell.widthCell;
      shiftedCells.additionalShiftCell?.yCoord += sizeCell.heightCell;
      shiftedCells.additionalShiftCell?.duration = durationAnimation.durationDiagonalAnimation;
    }
  }
}
