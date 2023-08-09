part of '../../../puzzle.dart';

mixin _RelocationCells {
  /// Cell relocation after horizontal shift
  static void horizontalRelocation({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required _GridPuzzle grid,
  }) {
    if (shiftedCells.swipe.direction == DirectionSwipe.left) {
      //? Relocation when shifting to the left
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllRows.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.xCoord += sizeCell.widthCell * grid.xCountCells;
          cell.duration = 0;
          break;
        }
      }
    } else {
      //? Relocation when shifting to the right
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllRows.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.xCoord -= sizeCell.widthCell * grid.xCountCells;
          cell.duration = 0;
          break;
        }
      }
    }
  }

  /// Cell relocation after vertical shift
  static void verticalRelocation({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required _GridPuzzle grid,
  }) {
    if (shiftedCells.swipe.direction == DirectionSwipe.up) {
      //? Relocation when shifting to the up
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.yCoord = sizeCell.heightCell * (grid.yCountCells - 1);
          cell.duration = 0;
          break;
        }
      }
    } else {
      //? Relocation when shifting to the down
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.yCoord = 0;
          cell.duration = 0;
          break;
        }
      }
    }
  }

  /// Cell relocation after a diagonal shift
  static void diagonalRelocation({
    required CellsDataShifted shiftedCells,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required _GridPuzzle grid,
  }) {
    int countShiftedCells = shiftedCells.listMainShiftCells.length;
    //
    if (shiftedCells.swipe.direction == DirectionSwipe.upLeft) {
      //? Relocation when shifting to the upLeft
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listLeftDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.xCoord += sizeCell.widthCell * countShiftedCells;
          cell.yCoord += sizeCell.heightCell * countShiftedCells;
          cell.duration = 0;
          break;
        }
      }
    } else if (shiftedCells.swipe.direction == DirectionSwipe.downRight) {
      //? Relocation when shifting to the downRight
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listLeftDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.xCoord -= sizeCell.widthCell * countShiftedCells;
          cell.yCoord -= sizeCell.heightCell * countShiftedCells;
          cell.duration = 0;
          break;
        }
      }
    } else if (shiftedCells.swipe.direction == DirectionSwipe.upRight) {
      //? Relocation when shifting to the downRight
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listRightDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.last) {
          cell.xCoord -= sizeCell.widthCell * countShiftedCells;
          cell.yCoord += sizeCell.heightCell * countShiftedCells;
          cell.duration = 0;
          break;
        }
      }
    } else {
      //? Relocation when shifting to the downLeft
      for (ViewCell cell in shiftedCells.listMainShiftCells) {
        if (cell.idPositionCell == cells.sectionsDataPuzzle.listRightDiagonals.elementAt(shiftedCells.indexSectionShift).listItemCells.first) {
          cell.xCoord += sizeCell.widthCell * countShiftedCells;
          cell.yCoord -= sizeCell.heightCell * countShiftedCells;
          cell.duration = 0;
          break;
        }
      }
    }
  }
}
