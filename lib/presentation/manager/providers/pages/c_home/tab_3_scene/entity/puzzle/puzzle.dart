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
part 'actions/shift/shift.dart';
part 'actions/shift/mixins/definition.dart';
part 'actions/shift/mixins/performance.dart';
part 'actions/shift/mixins/relocation.dart';
part 'actions/shift/mixins/updates.dart';
part 'actions/entity/view_cell.dart';
part 'actions/entity/swipe_data.dart';
part 'actions/entity/cell_shifted.dart';
part 'actions/entity/duration.dart';

/// Main puzzle class
/// Contains properties and methods for:
///   1. shaping the puzzle;
///   2. puzzle shear calculations;
///   3. determining the solution to the puzzle;
///   4. definition of winning a game;
///   5. puzzle restarts.
final class PuzzleEntity {
  /// Puzzle play area.
  final playArea = _PlayArea();

  /// Data of scene.
  final scene = _DataScene();

  /// Puzzle statuses.
  final status = _StatusPuzzle();

  /// The unique key of a correctly folded puzzle.
  final keys = _KeysPuzzle();

  /// Сontains lists of the main and additional cells of the game.
  final cells = _CellsPuzzle();

  /// Сontains lists of the main and additional cells of the game.
  final swipe = _SwipePuzzle();

  /// Timer to keep track of puzzle folding time.
  final timer = _TimerGame();

  /// Set default options when launching any game.
  void setDefaultParameters({required String grid, required Size sizeWindow}) {
    keys.setDefaultParameters(grid);
    playArea.sizePlayArea.setDefaultParameters(w: sizeWindow.width, h: sizeWindow.height);
  }

  /// Checking the first start when swiping the scene page.
  bool isFirstRunThisScene() => scene.useIdScene == -1;

  /// Old (previously loaded) data will be returned if idScene has not changed and game go on (puzzle not completed).
  bool isOldSceneUsed({required int idNewSeries, required int idNewScene}) {
    return (idNewSeries == scene.useIdSeries && idNewScene == scene.useIdScene && !keys.isKeysPuzzleEqual());
  }

  /// Waiting for puzzle cells to shift.
  Future<void> puzzleShiftWaiting(TypeAxisSwipe axis) async {
    final waitingTime = switch (axis) {
      TypeAxisSwipe.diagonal => playArea.durationAnimation.durationDiagonalAnimation,
      _ => playArea.durationAnimation.durationSimpleAnimation,
    };
    await Future.delayed(Duration(milliseconds: waitingTime));
  }

  ///! Setting game launch state
  void setGameLaunchState(SceneEntity dataScene) {
    status.setGameLaunchState();
    scene.setGameLaunchState(dataScene);
    keys.setGameLaunchState(dataScene.grid);
    cells.setGameLaunchState();
  }

  /// Repeated return to the scene (for example,
  /// when the user returns to the scenes page, and
  /// then goes back to the game to the same scene).
  void repeatedReturnToScene() {
    status.setGameLaunchState();
  }

  /// Restarting the puzzle scene.
  void restartGameLaunchState() {
    // 1 Setting default status for game.
    status.setGameLaunchState();
    cells.setGameLaunchState();
    // 2 Obfuscation of the key (puzzle cells with the image will line up on it).
    keys.mixCurrentKeys(_ActionMixData.mixData(
      currentKeys: keys._currentGameListKeysPuzzleWin,
      hardLevel: scene.hardLevel,
      xCountCells: playArea.grid.xCountCells,
      yCountCells: playArea.grid.yCountCells,
    ));
    // 3 Creation of basic and game cells of the puzzle.
    cells.creatingCellsPuzzle(
      listKeys: keys._currentGameListKeysPuzzleWin,
      grid: playArea.grid,
      cell: playArea.sizeCell,
    );
    // 4 Create data and cell coordinates.
    cells.addSectionsData(
      grid: playArea.grid,
      cell: playArea.sizeCell,
    );
  }

  ///! Installing and configuring the basic parameters of the puzzle:
  /// 1. Scene key shuffle.
  /// 2. Formation of image cell parameters.
  /// 3. Setting the angle limit for a diagonal swipe.
  void setMainSettingsPuzzle() async {
    // 1
    // playArea.aScale = ConfigNumbers.getNumRound(720 / playArea.sizePlayArea.widthPlayArea);
    playArea.grid.set(xCells: scene.grid.xCount, yCells: scene.grid.yCount);
    // 2 Obfuscation of the key (puzzle cells with the image will line up on it).
    keys.mixCurrentKeys(_ActionMixData.mixData(
      currentKeys: keys._currentGameListKeysPuzzleWin,
      hardLevel: scene.hardLevel,
      xCountCells: playArea.grid.xCountCells,
      yCountCells: playArea.grid.yCountCells,
    ));
    // 3 Adjusting play area sizes and cell sizes
    playArea.adjustmentSize();
    // 4 Defining the angle range of a diagonal swipe
    swipe.diagonalConstraints.set(
      _ActionSwipe.getConstraintRangeDiagonalSwipe(
        catetX: playArea.sizeCell.widthCell,
        catetY: playArea.sizeCell.heightCell,
        rangeAngle: swipe.diagonalConstraints.rangeIdentDiagonalSwipe,
      ),
    );
    // 5 Creation of basic and game cells of the puzzle.
    cells.creatingCellsPuzzle(
      listKeys: keys._currentGameListKeysPuzzleWin,
      grid: playArea.grid,
      cell: playArea.sizeCell,
    );
    // 6 Create data and cell coordinates.
    cells.addSectionsData(
      grid: playArea.grid,
      cell: playArea.sizeCell,
    );
  }

  ///! Preparing cell coordinates for shifting.
  /// Swipe may not be available if the user is swiping diagonally,
  /// but the scene does not allow diagonal swiping or the initial
  /// cell of a swipe is forbidden for a diagonal swipe.
  /// Therefore, a check is made on [SceneProvider].
  CellsDataShifted? definitionCellsShift() {
    // Storage and transfer of shift cells
    final shiftedCells = CellsDataShifted();
    // Swipe type and direction calculations
    final dataSwipe = _ActionSwipe.getDataSwipe(
      startCoord: swipe.coord.startCoord,
      endCoord: swipe.coord.endCoord,
      maxAngle: swipe.diagonalConstraints.maxAngleDiagonalSwipe,
      minAnle: swipe.diagonalConstraints.minAngleDiagonalSwipe,
    );
    shiftedCells.setDataSwipe(dataSwipe);
    // Calculating cell data to be shifted
    return _ActionShift.shiftCellCalculation(
      shiftedCells: shiftedCells,
      swipeCoord: swipe.coord,
      cells: cells,
      sizeCell: playArea.sizeCell,
      hardLevel: scene.hardLevel,
      grid: playArea.grid,
    );
  }

  ///! Perform shift now
  void performShiftNow(CellsDataShifted shiftedCells) {
    _ActionShift.performShiftNow(
      shiftedCells: shiftedCells,
      cells: cells,
      sizeCell: playArea.sizeCell,
      durationAnimation: playArea.durationAnimation,
      grid: playArea.grid,
    );
  }

  /// Relocation a cell from the main list of cells, which, during
  /// the shift, went outside the play area, to the start or end
  /// position, depending on the type and direction of the swipe.
  void relocationMainCellFromOutsideZone(CellsDataShifted shiftedCells) {
    _ActionShift.relocationCell(
      shiftedCells: shiftedCells,
      cells: cells,
      sizeCell: playArea.sizeCell,
      grid: playArea.grid,
    );
  }

  /// Updating the image of all additional cells;
  /// Offset of a cell of an additional cell to its original position.
  void updateAdditionCell(CellsDataShifted shiftedCells) {
    _ActionShift.updateAdditionCell(
      shiftedCells: shiftedCells,
      cells: cells,
      grid: playArea.grid,
    );
  }

  /// Checking the scene combination to show the winner.
  ({bool isWin, int time}) checkingWinningPuzzleCombination(CellsDataShifted shiftedCells) {
    // Checking the winning combination of puzzle cells.
    final isWin = keys.checkingWinningCombination(
      _ActionShift.formatingCellKeysCombination(
        shiftedCells: shiftedCells,
        cells: cells,
      ),
    );
    if (!isWin) return (isWin: false, time: 0);
    status.isAvailableSwipe = false;
    final resultTime = timer.stop();
    return (isWin: true, time: resultTime);
  }
}
