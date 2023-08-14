part of '../scene.dart';

/// Class for tracking the status of additional pages
final class _StatusAdditionPages {
  // High-resolution image display
  var displayImageHD = StatusContent.isNoneContent;
  // Display winners page
  var winnerPage = StatusContent.isNoneContent;

  // Start new game
  setDefaultParameters() {
    // Hide addition pages
    displayImageHD = StatusContent.isNoneContent;
    winnerPage = StatusContent.isNoneContent;
  }
}
