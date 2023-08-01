part of '../../puzzle.dart';

class ViewCell {
  // Current cell position (changes for main cells, does not change for additional cells)
  int idPositionCell = 0;
  // Initial cell position (count cell = 9 => indexCall = 0-8). Changes after cell shift
  final int idIndexCell;
  // An immutable cell key equal to the index of its correct position
  final int keyCell;
  double xCoord;
  double yCoord;
  final double xHomeCoord;
  final double yHomeCoord;

  // Helper display
  bool isDisplayHelper = false;

  final ImageUnitScene image;
  // Cell shift animation duration (different for linear and diagonal shifts)
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
  }
  // Performing relocation of an additional cell to home init position
  toHome() {
    xCoord = xHomeCoord;
    yCoord = yHomeCoord;
    duration = 0;
  }
}

/// The class contains the image path and image offset coordinates for each cell
final class ImageUnitScene {
  String url = ""; // for image
  /// Offset coordinates for the image. Use minus, because it is necessary
  /// to move down from the 0.0 coordinate of the upper left corner of the image
  double xOffset;
  double yOffset;

  ImageUnitScene(Offset offset)
      : xOffset = -offset.dx,
        yOffset = -offset.dy;

  update(ImageUnitScene image) {
    xOffset = image.xOffset;
    yOffset = image.yOffset;
    url = image.url;
  }
}
