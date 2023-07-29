part of '../../../puzzle.dart';

/// Class for storing lists of rows, columns, left and right diagonals,
/// as well as lists of cells that should not be used when swiping left or right diagonals.
/// Each list contains serial numbers and coordinates of each cell for each row, column, diagonal
class SectionDataPuzzle {
  /// List of coordinates and positions of each cell in each row
  final listSectionsAllRows = <RowColumnCoord>[];

  /// List of coordinates and positions of each cell in each column
  final listSectionsAllColumns = <RowColumnCoord>[];

  /// List of coordinates and positions of each cell for left diagonals
  final listLeftDiagonals = <Diagonal>[];

  /// List of coordinates and positions of each cell for right diagonals
  final listRightDiagonals = <Diagonal>[];

  /// List of cell indexes on which the left swipe should not work
  final listCellsNotChangeWheneLeftDiagonalSwipe = <int>[];

  /// List of cell indexes on which the right swipe should not work

  final listCellsNotChangeWheneRightDiagonalSwipe = <int>[];

  /// Clear all list
  void clear() {
    listSectionsAllRows.clear();
    listSectionsAllColumns.clear();
    listLeftDiagonals.clear();
    listRightDiagonals.clear();
    listCellsNotChangeWheneLeftDiagonalSwipe.clear();
    listCellsNotChangeWheneRightDiagonalSwipe.clear();
  }
}

/// The class contains a list of cells that are part of a row or column section,
/// as well as the coordinates/dimensions of this section
class RowColumnCoord {
  /// Contains the ordinal numbers of the cells that are included in the given row or column
  final List<int> listItemCells;

  /// Contains the cell coordinates and the position (serial number) of the cell in a row or column
  final SectionCoordinates? sectionCoordinates;

  RowColumnCoord({required this.listItemCells, required this.sectionCoordinates});
}

/// The class contains the cell coordinates and the position (serial number) of the cell in a row or column
class SectionCoordinates {
  final double x;
  final double w;
  final double y;
  final double h;
  final int itemAxis;

  SectionCoordinates({
    required this.x,
    required this.w,
    required this.y,
    required this.h,
    required this.itemAxis,
  });
}

/// The class contains a list of ordinal numbers of cells that are included in the given diagonal
class Diagonal {
  /// Contains the ordinal numbers of the cells that are included in the given diagonal
  final List<int> listItemCells;

  Diagonal(this.listItemCells);
}
