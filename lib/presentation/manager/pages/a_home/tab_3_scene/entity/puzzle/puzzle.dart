import 'dart:math';
import 'dart:ui';

import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';

part 'entity/playarea.dart';
part 'entity/timer.dart';
part 'entity/keys.dart';
part 'entity/scene.dart';
part 'entity/status.dart';
part 'entity/swipe.dart';
part 'entity/cells/cells.dart';
part 'entity/cells/entity/side_units.dart';
part 'entity/cells/entity/coord.dart';
part 'actions/swipe.dart';
part 'actions/mix.dart';

final class PuzzleEntity {
  final actionAxisSwipe = _ActionAxisSwipe();
  final actionMixData = _ActionMixData();

  ///
  final playArea = _PlayArea();

  /// Data of scene
  final scene = _DataScene();

  /// Puzzle statuses
  final status = _StatusPuzzle();

  /// The unique key of a correctly folded puzzle
  final keys = _KeysPuzzle();

  /// Сontains lists of the main and additional cells of the game
  final cells = _CellsPuzzle();

  /// Сontains lists of the main and additional cells of the game
  final swipe = _SwipePuzzle();

  /// Timer to keep track of puzzle folding time
  final timer = _TimerGame();

  /// Set default options when launching any game
  void setDefaultParameters({required String grid, required Size sizeWindow}) {
    keys.setDefaultParameters(grid);
    playArea.sizePlayArea.setDefaultParameters(w: sizeWindow.width, h: sizeWindow.height);
  }

  /// Checking the first start when swiping the scene page
  bool isFirstRunThisScene() => scene.useIdScene == -1;
  // Checking if the user is running the previous scene for the game
  bool checkingThisIsGameWithPreviousScene({required int idNewSeries, required int idNewScene}) {
    // true - if the new game is launched with the parameters of the old scene
    return (idNewSeries == scene.useIdSeries && idNewScene == scene.useIdScene && keys.isKeysPuzzleEqual());
  }

  /// Old (previously loaded) data will be returned if idScene has not changed
  bool isOldSceneUsed(int idNewSeires) => scene.useIdScene == idNewSeires;

  ///! Setting game launch state
  void setGameLaunchState(SceneEntity dataScene) {
    status.setGameLaunchState();
    scene.setGameLaunchState(dataScene);
    keys.setGameLaunchState(dataScene.grid);
    cells.setGameLaunchState(dataScene);
  }

  ///! Installing and configuring the basic parameters of the puzzle:
  /// 1. Scene key shuffle
  /// 2. Formation of image cell parameters
  /// 3. Setting the angle limit for a diagonal swipe
  void setMainSettingsPuzzle() async {
    // 1
    playArea.aScale = ConfigNumbers.getNumRound(720 / playArea.sizePlayArea.widthPlayArea);
    playArea.grid.set(xCells: scene.grid.xCount, yCells: scene.grid.yCount);
    // 2 Obfuscation of the key (puzzle cells with the image will line up on it)
    keys.mixCurrentKeys(actionMixData.mixData(
      currentKeys: keys._currentGameListKeysPuzzleWin,
      hardLevel: scene.hardLevel,
      xCountCells: playArea.grid.xCountCells,
      yCountCells: playArea.grid.yCountCells,
    ));
    // 3 Adjusting play Area sizes and cell sizes
    playArea.adjustmentSize();
    // 4 Defining the angle range of a diagonal swipe
    swipe.diagonalConstraints.set(
      actionAxisSwipe.getConstraintRangeDiagonalSwipe(
        catetX: playArea.sizeCell.heightCell,
        catetY: playArea.sizeCell.widthCell,
        rangeAngle: swipe.diagonalConstraints.rangeIdentDiagonalSwipe,
      ),
    );
    // 5 Creation of basic and game cells of the puzzle
    cells.creatingCellsPuzzle(
      listKeys: keys._currentGameListKeysPuzzleWin,
      grid: playArea.grid,
      cell: playArea.sizeCell,
    );
    // 6 Create data and cell coordinates
    cells.addSectionsData(
      grid: playArea.grid,
      cell: playArea.sizeCell,
    );
  }
}
