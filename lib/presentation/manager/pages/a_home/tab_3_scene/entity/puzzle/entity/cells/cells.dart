part of '../../puzzle.dart';

/// The class contains lists of the main and additional cells of the game
final class _CellsPuzzle {
  /// Сontains main cells and diagonals
  List<ViewCell> listMainCell = [];

  /// Lists of additional cells (outside the scope) that are needed to move the puzzle
  AdditionalPuzzleCells additionalCells = AdditionalPuzzleCells();

  /// Lists of coordinates and positions of each cell section and cells in each section (row, column, diagonal)
  _SectionDataPuzzle sectionsDataPuzzle = _SectionDataPuzzle();

  ///! Setting game launch state
  void setGameLaunchState(SceneEntity dataScene) {
    listMainCell.clear();
    additionalCells.clear();
    sectionsDataPuzzle.clear();
  }

  /// Creation of basic and game cells of the puzzle
  void creatingCellsPuzzle({required List<int> listKeys, required _GridPuzzle grid, required _SizeCell cell}) {
    // listItemsScene.clear();
    // listSideItemsScene.clear();
    int indexCell = 0;

    for (int itemRow = 0; itemRow < grid.yCountCells; itemRow++) {
      for (int itemColumn = 0; itemColumn < grid.xCountCells; itemColumn++) {
        // Creating basic cells
        _creatingMainCells(listKeys: listKeys, itemColumn: itemColumn, itemRow: itemRow, indexCell: indexCell, grid: grid, cell: cell);
        // Сreating additional cells
        _creatingAdditionalCells(listKeys: listKeys, itemColumn: itemColumn, itemRow: itemRow, indexCell: indexCell, grid: grid, cell: cell);
        indexCell++;
      }
    }
  }

  /// Creating basic cells
  void _creatingMainCells({
    required List<int> listKeys,
    required int itemColumn,
    required int itemRow,
    required int indexCell,
    required _GridPuzzle grid,
    required _SizeCell cell,
  }) {
    final xCoord = cell.widthCell * itemColumn;
    final yCoord = cell.heightCell * itemRow;
    final keyCell = listKeys[indexCell];
    final xOffest = ((keyCell - 1) % grid.xCountCells) * cell.widthCell;
    final yOffest = ((keyCell - 1) / grid.xCountCells).floor() * cell.heightCell;

    listMainCell.add(
      ViewCell(
        xCoord: xCoord,
        yCoord: yCoord,
        idIndexCell: indexCell,
        keyCell: keyCell,
        offsetImage: Offset(xOffest, yOffest),
      ),
    );
  }

  /// Сreating additional cells
  void _creatingAdditionalCells({
    required List<int> listKeys,
    required int itemColumn,
    required int itemRow,
    required int indexCell,
    required _GridPuzzle grid,
    required _SizeCell cell,
  }) {
    if (indexCell < grid.xCountCells) {
      // Bottom [0-2]
      final xCoord = cell.widthCell * itemColumn;
      final yCoord = cell.heightCell * grid.yCountCells;
      final idIndexCell = itemColumn;
      final keyCell = listKeys[indexCell];
      final xOffset = ((keyCell - 1) % grid.xCountCells) * cell.widthCell;
      final yOffset = ((keyCell - 1) / grid.xCountCells).floor() * cell.heightCell;
      additionalCells.listBottomAdditionalCells.add(
        ViewCell(
          xCoord: xCoord,
          yCoord: yCoord,
          idIndexCell: idIndexCell,
          keyCell: keyCell,
          offsetImage: Offset(xOffset, yOffset),
        ),
      );
    } else if (indexCell >= (grid.square - grid.xCountCells)) {
      // Top [6-8]
      final xCoord = cell.widthCell * itemColumn;
      final yCoord = -cell.heightCell;
      final idIndexCell = (grid.square - grid.xCountCells + itemColumn);
      final keyCell = listKeys[indexCell];
      final xOffset = ((keyCell - 1) % cell.widthCell) * cell.widthCell;
      final yOffset = ((keyCell - 1) / cell.widthCell).floor() * cell.heightCell;
      additionalCells.listTopAdditionalCells.add(
        ViewCell(
          xCoord: xCoord,
          yCoord: yCoord,
          idIndexCell: idIndexCell,
          keyCell: keyCell,
          offsetImage: Offset(xOffset, yOffset),
        ),
      );
    }
    // Left [2,5,8]
    if (indexCell != 0 && (indexCell + 1) % (grid.xCountCells) == 0) {
      final xCoord = -cell.widthCell;
      final yCoord = cell.heightCell * itemRow - 1;
      final idIndexCell = indexCell;
      final keyCell = listKeys[indexCell];
      final xOffset = ((keyCell - 1) % grid.xCountCells) * cell.widthCell;
      final yOffset = ((keyCell - 1) / grid.xCountCells).floor() * cell.heightCell;
      additionalCells.listLeftAdditionalCells.add(
        ViewCell(
          xCoord: xCoord,
          yCoord: yCoord,
          idIndexCell: idIndexCell,
          keyCell: keyCell,
          offsetImage: Offset(xOffset, yOffset),
        ),
      );
    }
    // Right [0,3,6]
    if (indexCell == 0 || indexCell % grid.xCountCells == 0) {
      final xCoord = cell.widthCell * grid.xCountCells;
      final yCoord = cell.heightCell * itemRow;
      final idIndexCell = indexCell;
      final keyCell = listKeys[indexCell];
      final xOffset = ((keyCell - 1) % grid.xCountCells) * cell.widthCell;
      final yOffset = ((keyCell - 1) / grid.xCountCells).floor() * cell.heightCell;
      additionalCells.listRightAdditionalCells.add(
        ViewCell(
          xCoord: xCoord,
          yCoord: yCoord,
          idIndexCell: idIndexCell,
          keyCell: keyCell,
          offsetImage: Offset(xOffset, yOffset),
        ),
      );
    }
  }

  /// Adding section parameters (rows, columns, right and left diagonals)
  Future<void> addSectionsData({required _GridPuzzle grid, required _SizeCell cell}) async {
    final listRowCoordItems = <int, SectionCoordinates>{};
    final listColumnsCoordItems = <int, SectionCoordinates>{};

    // Formation of a list of coordinates (0-Y) of scene rows to write these
    // coordinates to the corresponding cells of the scene
    for (var y = 0; y < grid.yCountCells; y++) {
      listRowCoordItems[y] = SectionCoordinates(
        x: 0,
        w: 0,
        y: cell.heightCell * y,
        h: cell.heightCell * (y + 1),
        itemAxis: y,
      );
    }

    // Formation of a list of coordinates (0-X) of the scene columns to write these
    // coordinates to the corresponding cells of the scene
    for (var x = 0; x < grid.xCountCells; x++) {
      listColumnsCoordItems[x] = SectionCoordinates(
        x: cell.widthCell * x,
        w: cell.widthCell * (x + 1),
        y: 0,
        h: 0,
        itemAxis: x,
      );
    }

    // (ROW) Formation of a list of coordinates and positions of each cell of the scene for each row of the scene
    int itemRow = 0;
    List<int> listPosItemRow = [];
    for (int i = 0; i < grid.square; i++) {
      listPosItemRow.add(i);
      if (listPosItemRow.length == grid.xCountCells) {
        sectionsDataPuzzle.listSectionsAllRows.add(
          RowColumnCoord(
            listItemCells: listPosItemRow,
            coordinates: listRowCoordItems[itemRow]!,
          ),
        );
        listPosItemRow = [];
        itemRow++;
      }
    }

    // (COLUMN) Formation of a list of coordinates and positions of each cell of the scene for each column of the scene
    final listItemColumn = <int, List<int>>{};

    int itemColumn = 0;
    for (var i = 0; i < grid.square; i++) {
      if (listItemColumn[itemColumn] == null) listItemColumn[itemColumn] = [];
      listItemColumn[itemColumn]!.add(i);
      if ((itemColumn + 1) < grid.xCountCells) {
        itemColumn++;
      } else {
        itemColumn = 0;
      }
    }

    //
    for (final MapEntry(key: item, value: list) in listItemColumn.entries) {
      sectionsDataPuzzle.listSectionsAllColumns.add(
        RowColumnCoord(
          listItemCells: list,
          coordinates: listColumnsCoordItems[item]!,
        ),
      );
    }

    // (DIAGONAL) Forming a list of item cells of left and right diagonals
    int minCount = min(grid.xCountCells, grid.yCountCells);
    // Forming an array with the indices of the initial cells of the diagonals
    final leftDiagonalStartIndex = <int>[]; // Array of starting cells of left-handed diagonals `\`
    final rightDiagonalStartIndex = <int>[]; // Array of starting cells of right-handed diagonals `/`
    // 1.
    for (var i = 0; i < grid.square; i++) {
      // for left-handed diagonal `\`
      if (i < grid.xCountCells - 1) {
        leftDiagonalStartIndex.add(i);
      } else if (i % grid.xCountCells == 0 && i != (grid.square - grid.xCountCells)) {
        leftDiagonalStartIndex.add(i);
      }
      // for right-handed diagonal  `/`
      if (i > 0 && i < grid.xCountCells) {
        rightDiagonalStartIndex.add(i);
      } else if ((grid.square - grid.xCountCells - i - 1) % grid.xCountCells == 0 && i != grid.square - 1) {
        rightDiagonalStartIndex.add(i);
      }
    }

    // 2. Formation of left-handed diagonals `\`
    for (int startIndexDiagonal in leftDiagonalStartIndex) {
      final listIndexDiagonal = <int>[];
      for (int k = 0; k < minCount; k++) {
        final bufIndex = startIndexDiagonal + (grid.xCountCells + 1) * k;
        if (bufIndex < grid.square && (k == 0 || bufIndex != (k + 1) * grid.xCountCells && k != 0)) {
          listIndexDiagonal.add(bufIndex);
        } else {
          break;
        }
      }
      sectionsDataPuzzle.listLeftDiagonals.add(Diagonal(listIndexDiagonal));
    }

    // Formation of right-handed diagonals `/`
    for (int startIndexDiagonal in rightDiagonalStartIndex) {
      final listIndexDiagonal = <int>[];
      for (int k = 0; k < minCount; k++) {
        final bufIndex = startIndexDiagonal + (grid.xCountCells - 1) * k;
        if (bufIndex < grid.square && bufIndex != ((grid.xCountCells * k) - 1)) {
          listIndexDiagonal.add(bufIndex);
        } else {
          break;
        }
      }
      sectionsDataPuzzle.listRightDiagonals.add(Diagonal(listIndexDiagonal));
    }

    // Forming a list of cells
    _creatingAdditionalDiagonalCells(grid: grid, cell: cell);

    // Formation of forbidden indexes for a swipe depending on the swipe vector
    // Setting forbidden cells for swipe left-handed diagonal `\`
    sectionsDataPuzzle.listNotAllowedCellsForLeftDiagonalSwipe.addAll([
      listMainCell[grid.xCountCells - 1].idIndexCell,
      listMainCell[grid.xCountCells * (grid.yCountCells - 1)].idIndexCell,
    ]);

    // Setting forbidden cells for swipe right-handed diagonal `/`
    sectionsDataPuzzle.listNotAllowedCellsForRightDiagonalSwipe.addAll([
      listMainCell.first.idIndexCell,
      listMainCell.last.idIndexCell,
    ]);
  }

  /// Formation of a list of cells that are used to replace the original cells of the diagonals when performing a swipe
  void _creatingAdditionalDiagonalCells({required _GridPuzzle grid, required _SizeCell cell}) {
    // Scrolls through the list of diagonals, for each of them the first and last element is selected
    // according to the indices of these elements, the corresponding cells are found in the general list
    // of original cells to obtain their offset coordinates.
    // From the received coordinates, the coordinates of the cells of the sides of the diagonal are formed

    // Forming cells for дуае-handed diagonals `\`
    for (final diagonal in sectionsDataPuzzle.listLeftDiagonals) {
      final firsItemDiagonal = diagonal.listItemCells.first; // the number of the starting cell of the diagonal is written to transfer it to the cell-sides
      final lastItemDiagonal = diagonal.listItemCells.last; // the number of the ending cell of the diagonal is written to transfer it to the cell-sides
      //
      final firstBufferUnitScene = listMainCell[firsItemDiagonal]; // the data of the first cell is written to the end diagonal
      final lastBufferUnitScene = listMainCell[lastItemDiagonal]; // the data of the first cell is written to the start diagonal
      //
      final xFirsCoord = firstBufferUnitScene.xCoord - cell.widthCell;
      final xFirstOffset = lastBufferUnitScene.image.xOffset.abs();

      final yFirstCoord = firstBufferUnitScene.yCoord - cell.heightCell;
      final yFirstOffset = lastBufferUnitScene.image.yOffset.abs();
      //
      final xLastCoord = lastBufferUnitScene.xCoord + cell.widthCell;
      final yLastCoord = lastBufferUnitScene.yCoord + cell.heightCell;
      final xLastOffset = firstBufferUnitScene.image.xOffset.abs();
      final yLastOffset = firstBufferUnitScene.image.yOffset.abs();
      //
      additionalCells.additionalDiagonal.listLeftTopAdditionalDiagonal.add(
        ViewCell(
          xCoord: xFirsCoord,
          yCoord: yFirstCoord,
          idIndexCell: lastBufferUnitScene.idIndexCell,
          keyCell: lastBufferUnitScene.keyCell,
          offsetImage: Offset(xFirstOffset, yFirstOffset),
        ),
      );
      //
      additionalCells.additionalDiagonal.listRightBottomAdditionalDiagonal.add(
        ViewCell(
          xCoord: xLastCoord,
          yCoord: yLastCoord,
          idIndexCell: firstBufferUnitScene.idIndexCell,
          keyCell: firstBufferUnitScene.keyCell,
          offsetImage: Offset(xLastOffset, yLastOffset),
        ),
      );
    }
    // Forming cells for right-handed diagonals `/`
    for (final diagonal in sectionsDataPuzzle.listRightDiagonals) {
      final firsItemDiagonal = diagonal.listItemCells.first; // the number of the starting cell of the diagonal is written to transfer it to the cell-sides
      final lastItemDiagonal = diagonal.listItemCells.last; // the number of the ending cell of the diagonal is written to transfer it to the cell-sides
      // for temporary records of original cells
      final firstBufferUnitScene = listMainCell[firsItemDiagonal]; // the data of the first cell is written to the end diagonal
      final lastBufferUnitScene = listMainCell[lastItemDiagonal]; // the data of the first cell is written to the start diagonal
      //
      final xFirsCoord = firstBufferUnitScene.xCoord + cell.widthCell;
      final yFirstCoord = firstBufferUnitScene.yCoord - cell.heightCell;
      final xFirstOffset = lastBufferUnitScene.image.xOffset.abs();
      final yFirstOffset = lastBufferUnitScene.image.yOffset.abs();
      //
      final xLastCoord = lastBufferUnitScene.xCoord - cell.widthCell;
      final yLastCoord = lastBufferUnitScene.yCoord + cell.heightCell;
      final xLastOffset = firstBufferUnitScene.image.xOffset.abs();
      final yLastOffset = firstBufferUnitScene.image.yOffset.abs();

      //
      additionalCells.additionalDiagonal.listRightTopAdditionalDiagonal.add(
        ViewCell(
          xCoord: xFirsCoord,
          yCoord: yFirstCoord,
          idIndexCell: lastBufferUnitScene.idIndexCell,
          keyCell: lastBufferUnitScene.keyCell,
          offsetImage: Offset(xFirstOffset, yFirstOffset),
        ),
      );
      //
      additionalCells.additionalDiagonal.listLeftBottomAdditionalDiagonal.add(
        ViewCell(
            xCoord: xLastCoord,
            yCoord: yLastCoord,
            idIndexCell: firstBufferUnitScene.idIndexCell,
            keyCell: firstBufferUnitScene.keyCell,
            offsetImage: Offset(xLastOffset, yLastOffset)),
      );
    }
  }

  /// Setting cell display helper
  void displayCellHelper(bool display) {
    for (var cell in listMainCell) {
      if ((cell.keyCell - 1) != cell.idPositionCell) {
        cell.isDisplayHelper = display;
      }
    }
  }

  /// Selecting an appropriate list of cells
  List<ViewCell> getCorrectList(TypeListCellsPuzzle typeList) {
    return switch (typeList) {
      // Main
      TypeListCellsPuzzle.main => listMainCell,
      // Additional sides
      TypeListCellsPuzzle.topSide => additionalCells.listTopAdditionalCells,
      TypeListCellsPuzzle.bottomSide => additionalCells.listBottomAdditionalCells,
      TypeListCellsPuzzle.leftSide => additionalCells.listLeftAdditionalCells,
      TypeListCellsPuzzle.rightSide => additionalCells.listRightAdditionalCells,
      // Additional diagonals
      TypeListCellsPuzzle.leftTopDiagonal => additionalCells.additionalDiagonal.listLeftTopAdditionalDiagonal,
      TypeListCellsPuzzle.leftBottomDiagonal => additionalCells.additionalDiagonal.listLeftBottomAdditionalDiagonal,
      TypeListCellsPuzzle.rightTopDiagonal => additionalCells.additionalDiagonal.listRightTopAdditionalDiagonal,
      TypeListCellsPuzzle.rightBottomDiagonal => additionalCells.additionalDiagonal.listRightBottomAdditionalDiagonal,
    };
  }
}
