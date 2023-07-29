part of '../scene.dart';

/// Class for tracking the status of additional pages
final class _StatusAdditionPages {
  // High-resolution image display
  var statusDisplayImageHD = StatusContent.isNoneContent;
  // Display winners page
  var statusWinnerPage = StatusContent.isNoneContent;
  //
  var statusSourceWinner = TypeSourceWinner.offline;

  // Start new game
<<<<<<< HEAD
  setDefaultParameters() {
=======
  runNewGame() {
>>>>>>> d5d523e151fc4c1af1c4c034f093a8af2bedd30b
    // Hide addition pages
    statusDisplayImageHD = StatusContent.isNoneContent;
    statusSourceWinner = TypeSourceWinner.offline;
  }
}
