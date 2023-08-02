part of '../../../puzzle.dart';

mixin _UpdatesCells {
  /// Updating additional cells on top
  static void updateTopAdditionCells({
    required CellsDataShifted shiftedCells,
    required ViewCell shiftedCell,
    required _CellsPuzzle cells,
    required _GridPuzzle grid,
  }) {
    for (ViewCell cell in cells.additionalCells.listTopAdditionalCells) {
      if (shiftedCells.swipe.axis == TypeAxisSwipe.horisontal && shiftedCells.indexSectionShift != (grid.yCountCells - 1)) {
        //  If the swipe is not on the extremely bottom column - exit
        break;
      }
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
  }

  /// Updating additional cells on bottom
  static void updateBottomAdditionCells({
    required CellsDataShifted shiftedCells,
    required ViewCell shiftedCell,
    required _CellsPuzzle cells,
    required _GridPuzzle grid,
  }) {
    for (ViewCell cell in cells.additionalCells.listBottomAdditionalCells) {
      if (shiftedCells.swipe.axis == TypeAxisSwipe.horisontal && shiftedCells.indexSectionShift != 0) {
        //  If the swipe is not on the extremely upper column - exit
        break;
      }
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
  }

  /// Updating additional cells on left
  static void updateLeftAdditionCells({
    required CellsDataShifted shiftedCells,
    required ViewCell shiftedCell,
    required _CellsPuzzle cells,
    required _GridPuzzle grid,
  }) {
    for (ViewCell cell in cells.additionalCells.listLeftAdditionalCells) {
      if (shiftedCells.swipe.axis == TypeAxisSwipe.vertical && shiftedCells.indexSectionShift != (grid.xCountCells - 1)) {
        //  If the swipe is not on the far right column - exit
        break;
      }
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
  }

  /// Updating additional cells on right
  static void updateRightAdditionCells({
    required CellsDataShifted shiftedCells,
    required ViewCell shiftedCell,
    required _CellsPuzzle cells,
  }) {
    for (ViewCell cell in cells.additionalCells.listRightAdditionalCells) {
      if (shiftedCells.swipe.axis == TypeAxisSwipe.vertical && shiftedCells.indexSectionShift != 0) {
        //  If the swipe is not on the far left column - exit
        break;
      }
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
  }

  /// Updating additional cells on left-handed diagonal '\'
  static void updateLeftDiagonalAdditionCells({
    required CellsDataShifted shiftedCells,
    required ViewCell shiftedCell,
    required _CellsPuzzle cells,
  }) {
    // Left top diagonal
    for (ViewCell cell in cells.additionalCells.additionalDiagonal.listLeftTopAdditionalDiagonal) {
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
    // Right bottom diagonal
    for (ViewCell cell in cells.additionalCells.additionalDiagonal.listRightBottomAdditionalDiagonal) {
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
  }

  /// Updating additional cells on right-handed diagonal '/'
  static void updateRightDiagonalAdditionCells({
    required CellsDataShifted shiftedCells,
    required ViewCell shiftedCell,
    required _CellsPuzzle cells,
  }) {
    // Left bottom diagonal
    for (ViewCell cell in cells.additionalCells.additionalDiagonal.listLeftBottomAdditionalDiagonal) {
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
    // Right top diagonal
    for (ViewCell cell in cells.additionalCells.additionalDiagonal.listRightTopAdditionalDiagonal) {
      if (cell.idPositionCell == shiftedCell.idPositionCell) {
        cell.image.update(shiftedCell.image);
        break;
      }
    }
  }
}
