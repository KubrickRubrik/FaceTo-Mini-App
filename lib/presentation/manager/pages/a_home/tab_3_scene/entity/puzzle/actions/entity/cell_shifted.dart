part of '../../puzzle.dart';

/// Class for storing and passing shift cells
final class CellsDataShifted {
  // List of main cells that participate in the shift
  List<ViewCell> listMainShiftCells = [];
  // Additional cell that will participate in the shift
  ViewCell? additionalShiftCell;
  // Sequence number of the section for which the shift is performed [row? column or diagonal]
  int indexSectionShift = 0;
  //
  final swipe = SwipeData();

  // Setting the swipe data that will be needed throughout the entire swipe operation
  void setDataSwipe(SwipeData data) {
    swipe.axis = data.axis;
    swipe.direction = data.direction;
  }
}
