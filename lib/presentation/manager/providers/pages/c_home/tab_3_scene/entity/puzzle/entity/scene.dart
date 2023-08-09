part of '../puzzle.dart';

/// Main data of scene in puzzle
final class _DataScene {
  int useIdScene = -1; // id of the used scene
  int useIdSeries = -1; // id of the used series
  int hardLevel = -1; // off diagonal swipe
  var imageScene = ImageScene.empty();
  ({int xCount, int yCount}) grid = (xCount: 3, yCount: 3);

  ///! Setting game launch state
  setGameLaunchState(SceneEntity data) {
    useIdScene = data.idScene;
    useIdSeries = data.idSeries;
    hardLevel = data.hardLevel;
    imageScene = data.image;
    final v = data.grid.split('x').map((e) => int.parse(e));
    grid = (xCount: v.first, yCount: v.last);
  }
}
