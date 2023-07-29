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

class ViewCell {
  // Current cell position (changes for main cells, does not change for additional cells)
  int idPositionCell = 0;
  // Initial cell position (count cell = 9 => indexCall = 0-8). Changes after cell shift
  final int idIndexCell;
  final int keyCell;
  final double xCoord;
  final double yCoord;
  final double xHomeCoord;
  final double yHomeCoord;

  int count = 0;
  //
  double helpOpacity = 0;
  double helpHomeSize = 50;
  double helpSize = 50;

  final ImageUnitScene image;
  int duration = 0;

  ViewCell({
    required this.xCoord,
    required this.yCoord,
    required this.idIndexCell,
    required this.keyCell,
    required Offset offsetImage,
  })  : xHomeCoord = xCoord,
        yHomeCoord = yCoord,
        image = ImageUnitScene(offsetImage) {
    idPositionCell = idIndexCell;
    count = idIndexCell;
  }
}

/// The class contains the image path and image offset coordinates for each cell
final class ImageUnitScene {
  String url = ""; // Адрес изображения
  /// Offset coordinates for the image. Use minus, because it is necessary
  /// to move down from the 0.0 coordinate of the upper left corner of the image
  final double xOffset;
  final double yOffset;

  ImageUnitScene(Offset offset)
      : xOffset = -offset.dx,
        yOffset = -offset.dy;
}
