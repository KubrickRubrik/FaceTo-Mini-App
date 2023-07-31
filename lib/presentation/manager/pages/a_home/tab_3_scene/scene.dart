import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/use_cases/scenes.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/entity/page.dart';
part 'state.dart';
part 'entity/status.dart';

final class SceneProvider extends ChangeNotifier with _State {
  SceneProvider(this._scenesCase);
  final ScenesCase _scenesCase;

  /// Launching the game when swiping the scenes page [PageTabScenes]
  /// Launching the game when clicking on a item of scene on the scenes page [PageTabScenes]
  /// returns `true` when swipe to game page is allowed
  Future<bool?> runPuzzleGame({required SceneEntity scene, required Size size}) async {
    pageData.puzzle.timer.start();
    print("RUN PUZZLE GAME ${scene.idScene}");
    if (super.actionStatus == ActionStatus.isAction) return null;
    _setActions(ActionStatus.isAction, false);
    if (pageData.puzzle.isOldSceneUsed(scene.idScene)) {
      _setActions(ActionStatus.isDone, false);
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
    // pageData.puzzle.timer.start();
    print("ВРЕМЯ ${pageData.puzzle.timer.stop()}");
    notifyListeners();
    return true;
  }

  Future<void> runShift() async {
    if (!pageData.puzzle.status.isAvailableSwipe) return;
    pageData.puzzle.status.runShift();
    // Definition of cells to shift.
    final cellsForShifted = pageData.puzzle.definitionCellsShift();
    if (cellsForShifted == null) {
      pageData.puzzle.status.completeShift();
      return;
    }
    // Perform shift now
    pageData.puzzle.performShiftNow(cellsForShifted);

    //
    pageData.puzzle.status.completeShift();
  }

  // Future<void> getScenes(int idSeries) async {
  //   print("GET SERIES");
  //   if (super.actionStatus == ActionStatus.isAction) return;
  //   _setActions(ActionStatus.isAction, false);
  //   _setStatusPage(StatusContent.isLoadContent);
  //   final response = await _scenesCase.getScenes(idSeries);
  //   _setActions(ActionStatus.isDone, false);
  //   if (response.fail != null || response.data == null) {
  //     _setStatusPage(StatusContent.isNoContent);
  //   } else {
  //     _setStatusPage(StatusContent.isViewContent);
  //   }
  // }
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

  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  // Setting page status when loading data
  // void _setStatusPage(StatusContent val) {
  //   statusPage = val;
  //   notifyListeners();
  // }
}
