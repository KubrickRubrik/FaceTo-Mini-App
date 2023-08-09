import 'package:flutter/material.dart';
import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/sound/sound.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/domain/entities/dto/puzzle_stat.dart';
import 'package:facetomini/domain/use_cases/scene.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_3_scene/entity/page.dart';
part 'state.dart';
part 'entity/status.dart';

final class SceneProvider extends ChangeNotifier with _State {
  SceneProvider(this._seriesProvider, this._scenesProvider, this._sceneCase);
  final SeriesProvider _seriesProvider;
  final ScenesProvider _scenesProvider;
  final SceneCase _sceneCase;

  /// Launching the game when swiping the scenes page [PageTabScenes].
  /// Launching the game when clicking on a item of scene on the scenes page [PageTabScenes].
  /// Returns `true` when swipe to game page is allowed.
  Future<bool?> runPuzzleGame({required SceneEntity scene, required Size size}) async {
    if (super.actionStatus == ActionStatus.isAction) return null;
    _setActions(ActionStatus.isAction, false);
    if (pageData.puzzle.isOldSceneUsed(scene.idScene)) {
      _setActions(ActionStatus.isDone, false);
      statusAdditionPages.setDefaultParameters();
      pageData.puzzle.repeatedReturnToScene();
      return true;
    }
    // Set page statuses to initial position
    statusAdditionPages.setDefaultParameters(); // hide addition page
    pageData.puzzle.setDefaultParameters(grid: scene.grid, sizeWindow: size); // [keysPuzzle] and [sizePuzzle]
    //! Checking if the user is running the previous scene for the game
    if (pageData.puzzle.checkingThisIsGameWithPreviousScene(idNewSeries: scene.idSeries, idNewScene: scene.idScene)) {
      _setActions(ActionStatus.isDone, false);
      return true;
    }
    // This part of the code is executed if the user starts the game with the parameters of a new scene
    pageData.puzzle.setGameLaunchState(scene);
    pageData.puzzle.setMainSettingsPuzzle();
    _setActions(ActionStatus.isDone, false);
    notifyListeners();
    return true;
  }

  /// Method for shifting puzzle cells.
  /// After the shift, the winning combination is checked.
  Future<void> runShift() async {
    // Run timer of puzzle game
    if (!pageData.puzzle.timer.timer.isRunning) {
      pageData.puzzle.timer.start();
    }
    if (!pageData.puzzle.status.isAvailableSwipe) return;
    pageData.puzzle.status.runShift();

    // Definition of cells to shift.
    final cellsForShifted = pageData.puzzle.definitionCellsShift();

    if (cellsForShifted == null) {
      pageData.puzzle.status.completeShift();
      return;
    }
    // Perform shift now.
    locator<SoundController>().playShift();
    pageData.puzzle.performShiftNow(cellsForShifted);
    // await APP_AUDIO.soundSwipe();
    notifyListeners();
    // Waiting for the shift to execute
    await pageData.puzzle.puzzleShiftWaiting(cellsForShifted.swipe.axis);
    await Future.delayed(const Duration(milliseconds: 5));
    // Shift relocation
    pageData.puzzle.relocationMainCellFromOutsideZone(cellsForShifted);
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 5));
    // Updating the image of all additional cells.
    // Relocation of an additional cell.
    pageData.puzzle.updateAdditionCell(cellsForShifted);
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 15));
    pageData.puzzle.status.completeShift();
    // Checking the scene combination to show the winner.
    final result = pageData.puzzle.checkingWinningPuzzleCombination(cellsForShifted);
    if (result.isWin) await _formationWinner(result.time);
  }

  /// Formation of data of the winner
  /// Data is requested from the server, for comparison with other winners
  /// If the Internet is not available, the data is saved to the device database.
  Future<void> _formationWinner(int timeGame) async {
    // Page output for the winner
    statusAdditionPages.displayImageHD = StatusContent.isViewContent;
    statusAdditionPages.winnerPage = StatusContent.isLoadContent;
    locator<SoundController>().playWinner();
    notifyListeners();
    // Installing default puzzle data
    final puzzleData = PuzzleDataDTO(
      idSeries: pageData.puzzle.scene.useIdSeries,
      idScene: pageData.puzzle.scene.useIdScene,
      timeUser: timeGame,
    );
    _setActions(ActionStatus.isAction, false);
    // Request for online or offline puzzle statistics.
    // Generation of game scene and series statistics update data.
    // Formation of data for the page of winners.
    final response = await pageData.winner.saveDataWinner(
      seriesProvider: _seriesProvider,
      scenesProvider: _scenesProvider,
      sceneCase: _sceneCase,
      data: puzzleData,
    );
    _setActions(ActionStatus.isDone, false);
    if (response == null) {
      statusAdditionPages.winnerPage = StatusContent.isNoneContent;
      notifyListeners();
      return;
    }
    // Overwriting game series and scene statistics data.
    _seriesProvider.updateSeries(response);
    _scenesProvider.updateScene(response);
    // Formation of the page of winners
    statusAdditionPages.winnerPage = StatusContent.isViewContent;
    pageData.winner.formatWinner(updateData: response, puzzleData: puzzleData);
    notifyListeners();
  }

  /// Restarting the puzzle scene.
  /// Setting default parameters.
  void restartPuzzleScene() {
    statusAdditionPages.setDefaultParameters();
    pageData.puzzle.restartGameLaunchState();
    //  await APP_AUDIO.soundToScene();
    notifyListeners();
  }

  /// Start the next scene's puzzle.
  /// Setting default parameters.
  bool nextPuzzleScene() {
    final scenes = _scenesProvider.pageData.listScenes;
    final useIndexScene = scenes.indexWhere((element) => element.idScene == pageData.puzzle.scene.useIdScene);
    // If the scene is not found for some reason
    if (useIndexScene == -1) return false;
    // If the next scene is not available (all scenes are completed)
    if ((useIndexScene + 1) >= scenes.length) return false;
    // If the next scene is playable
    final scene = scenes.elementAt(useIndexScene + 1);
    final size = pageData.puzzle.playArea.sizePlayArea.getSize();
    //
    print("${pageData.puzzle.scene.useIdScene} - ${scene.idScene}");
    runPuzzleGame(scene: scene, size: size);

    return true;
  }

  /// Puzzle hint display.
  Future<void> displayHelper() async {
    if (pageData.puzzle.status.isDisplayHelperPuzzle) return;
    pageData.puzzle.status.displayHelper(true);
    //
    pageData.puzzle.cells.displayCellHelper(true);
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1500));
    pageData.puzzle.cells.displayCellHelper(false);
    pageData.puzzle.status.displayHelper(false);
    notifyListeners();
  }

  /// Image display after closing the winner view page.
  void displayImagePage() {
    statusAdditionPages.winnerPage = StatusContent.isNoneContent;
    notifyListeners();
  }

  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }
}
