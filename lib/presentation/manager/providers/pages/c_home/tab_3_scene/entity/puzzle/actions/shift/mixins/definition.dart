part of '../../../puzzle.dart';

mixin _DefinitionCells {
  /// Definition of horizontal shift cells
  static CellsDataShifted horizontalSwipeData({
    required CellsDataShifted shiftedCells,
    required _SwipeCoordinates swipeCoord,
    required _CellsPuzzle cells,
    required _GridPuzzle grid,
  }) {
    // Storage and transfer of shift cells
    int itemRowShift = 0;
    //? 1. Definition of main shift cells
    for (int itemRow = 0; itemRow < cells.sectionsDataPuzzle.listSectionsAllRows.length; itemRow++) {
      final sectionRow = cells.sectionsDataPuzzle.listSectionsAllRows.elementAt(itemRow);
      // Select the row on which the swipe occurred
      if (swipeCoord.startCoord.coordY > sectionRow.coordinates.y && swipeCoord.startCoord.coordY < sectionRow.coordinates.h) {
        itemRowShift = itemRow;
        shiftedCells.indexSectionShift = itemRow; //! Write down the serial number of the used row for shift
        // Selects all cells that are included in this section of the row
        for (ViewCell cell in cells.listMainCell) {
          if (sectionRow.listItemCells.contains(cell.idPositionCell)) {
            shiftedCells.listMainShiftCells.add(cell);
            if (shiftedCells.listMainShiftCells.length == grid.xCountCells) break;
          }
        }
        break;
      }
    }
    //? 2. Defining an additional shift cell for row
    if (shiftedCells.swipe.direction == DirectionSwipe.left) {
      shiftedCells.additionalShiftCell = cells.additionalCells.listRightAdditionalCells.elementAt(itemRowShift);
    } else {
      shiftedCells.additionalShiftCell = cells.additionalCells.listLeftAdditionalCells.elementAt(itemRowShift);
    }

    return shiftedCells;
  }

  /// Definition of vertical shift cells
  static CellsDataShifted verticalSwipeData({
    required CellsDataShifted shiftedCells,
    required _SwipeCoordinates swipeCoord,
    required _CellsPuzzle cells,
    required _GridPuzzle grid,
  }) {
    // Storage and transfer of shift cells
    int itemColumnShift = 0;
    //? 1. Definition of main shift cells
    for (int itemColumn = 0; itemColumn < cells.sectionsDataPuzzle.listSectionsAllColumns.length; itemColumn++) {
      final sectionColumn = cells.sectionsDataPuzzle.listSectionsAllColumns.elementAt(itemColumn);
      // Select the column on which the swipe occurred
      if (swipeCoord.startCoord.coordX > sectionColumn.coordinates.x && swipeCoord.startCoord.coordX < sectionColumn.coordinates.w) {
        itemColumnShift = itemColumn;
        shiftedCells.indexSectionShift = itemColumn; //! Write down the serial number of the used column for shift
        // Selects all cells that are included in this section of the column
        for (ViewCell cell in cells.listMainCell) {
          if (sectionColumn.listItemCells.contains(cell.idPositionCell)) {
            shiftedCells.listMainShiftCells.add(cell);
            if (shiftedCells.listMainShiftCells.length == grid.yCountCells) break;
          }
        }
        break;
      }
    }
    //? 2. Defining an additional shift cell for column
    if (shiftedCells.swipe.direction == DirectionSwipe.up) {
      shiftedCells.additionalShiftCell = cells.additionalCells.listBottomAdditionalCells.elementAt(itemColumnShift);
    } else {
      shiftedCells.additionalShiftCell = cells.additionalCells.listTopAdditionalCells.elementAt(itemColumnShift);
    }
    return shiftedCells;
  }

  /// Definition of diagonal shift cells.
  static CellsDataShifted? diagonalSwipeData({
    required CellsDataShifted shiftedCells,
    required _SwipeCoordinates swipeCoord,
    required _CellsPuzzle cells,
    required _SizeCell sizeCell,
    required int hardLevel,
  }) {
    if (hardLevel == -1) return null;
    // The index of the cell by which the diagonal is determined, which contains this index
    int indexCellInDiagoanal = 0;

    //? 1. Definition of main shift cells
    for (int itemRow = 0; itemRow < cells.sectionsDataPuzzle.listSectionsAllRows.length; itemRow++) {
      final sectionRow = cells.sectionsDataPuzzle.listSectionsAllRows.elementAt(itemRow);
      // Select the row on which the swipe occurred
      if (swipeCoord.startCoord.coordY > sectionRow.coordinates.y && swipeCoord.startCoord.coordY < sectionRow.coordinates.h) {
        for (var i = 0; i < sectionRow.listItemCells.length; i++) {
          if (swipeCoord.startCoord.coordX < (i + 1) * sizeCell.widthCell) {
            indexCellInDiagoanal = sectionRow.listItemCells.elementAt(i);
            break;
          }
        }
        break;
      }
    }
    // It is necessary to check whether the cell on which the swipe occurred is
    // forbidden for diagonal scrolling for diagonals (forbiddern cells [0,2,6,8])

    //? 2.1 Checking the swipe cell for the left-handed diagonal swipe `\`
    if ([DirectionSwipe.upLeft, DirectionSwipe.downRight].contains(shiftedCells.swipe.direction)) {
      // If the cell is forbidden for this type of diagonal swipe, the swipe is skipped
      if (cells.sectionsDataPuzzle.listNotAllowedCellsForLeftDiagonalSwipe.contains(indexCellInDiagoanal)) return null;
    }

    //? 2.2 Checking the swipe cell for the right-handed diagonal swipe `/`
    if ([DirectionSwipe.upRight, DirectionSwipe.downLeft].contains(shiftedCells.swipe.direction)) {
      // If the cell is forbidden for this type of diagonal swipe, the swipe is skipped
      if (cells.sectionsDataPuzzle.listNotAllowedCellsForRightDiagonalSwipe.contains(indexCellInDiagoanal)) return null;
    }

    //? 3. Getting a list of available diagonals for the corresponding swipe: `/` or `\`
    // List of diagonals of left or right type
    final listDiagonals = switch (shiftedCells.swipe.direction) {
      DirectionSwipe.upLeft || DirectionSwipe.downRight => cells.sectionsDataPuzzle.listLeftDiagonals,
      _ => cells.sectionsDataPuzzle.listRightDiagonals,
    };
    final listCellInDiagonal = <int>[];

    //? 4. Determining the diagonal that contains the cell that was swiped over to select all indices that the given diagonal contains
    for (var indexDiagonal = 0; indexDiagonal < listDiagonals.length; indexDiagonal++) {
      final diagonal = listDiagonals[indexDiagonal];
      for (int indexCell in diagonal.listItemCells) {
        if (indexCell == indexCellInDiagoanal) {
          listCellInDiagonal.addAll(diagonal.listItemCells);
          shiftedCells.indexSectionShift = indexDiagonal; //! Write down the serial number of the used diagonal for shift
          break;
        }
      }
      if (listCellInDiagonal.isNotEmpty) break;
    }

    //? 5. Definition of main shift cells
    for (ViewCell cell in cells.listMainCell) {
      if (listCellInDiagonal.contains(cell.idPositionCell)) {
        shiftedCells.listMainShiftCells.add(cell);
        if (shiftedCells.listMainShiftCells.length == listCellInDiagonal.length) break;
      }
    }

    //? 6 Defining an additional shift cell for diagonal
    if (shiftedCells.swipe.direction == DirectionSwipe.upLeft) {
      // For the left-handed diagonal `\`
      shiftedCells.additionalShiftCell = cells.additionalCells.additionalDiagonal.listRightBottomAdditionalDiagonal.elementAt(shiftedCells.indexSectionShift);
    } else if (shiftedCells.swipe.direction == DirectionSwipe.downRight) {
      // For the left-handed diagonal `\`
      shiftedCells.additionalShiftCell = cells.additionalCells.additionalDiagonal.listLeftTopAdditionalDiagonal.elementAt(shiftedCells.indexSectionShift);
    } else if (shiftedCells.swipe.direction == DirectionSwipe.upRight) {
      // For the right-handed diagonal `/`
      shiftedCells.additionalShiftCell = cells.additionalCells.additionalDiagonal.listLeftBottomAdditionalDiagonal.elementAt(shiftedCells.indexSectionShift);
    } else {
      // For the right-handed diagonal `/`
      shiftedCells.additionalShiftCell = cells.additionalCells.additionalDiagonal.listRightTopAdditionalDiagonal.elementAt(shiftedCells.indexSectionShift);
    }
    return shiftedCells;
  }
}
