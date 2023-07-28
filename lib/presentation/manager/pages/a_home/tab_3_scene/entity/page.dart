part of '../scene.dart';

/// Class for basic page data
final class _PageData {
  final puzzle = _PuzzleEntity();
  // Last used scene

  //

  // Overwriting the used idScene and clean for new data
  void overwritingPageData(SceneEntity data) {
    puzzle.set(data);
  }
}
