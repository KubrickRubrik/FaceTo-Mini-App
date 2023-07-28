import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/use_cases/scenes.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';
part 'entity/status.dart';
part 'entity/page.dart';
part 'entity/puzzle.dart';

final class SceneProvider extends ChangeNotifier with _State {
  SceneProvider(this._scenesCase);
  final ScenesCase _scenesCase;

  Future<bool?> setScene({required SceneEntity scene, required Size size}) async {
    print("SET Scene ${scene.idScene}");
    if (super.actionStatus == ActionStatus.isAction) return null;
    if (pageData.puzzle.isOldSceneUsed(scene.idScene)) return true;
    // Set page statuses to initial position
    statusPage = StatusContent.isLoadContent;
    statusAdditionPages.runNewGame(); // hide addition page
    pageData.puzzle.sizePuzzle.runNewGame(w: size.width, h: size.height); // Setting the size of the working window puzzle
    pageData.puzzle.keysPuzzle.runNewGame(scene.grid);
    // Checking if the user is running the previous scene for the game
    if (pageData.puzzle.checkingThisIsGameWithPreviousScene(idNewSeries: scene.idSeries, idNewScene: scene.idScene)) return true;
    // This part of the code is executed if the user starts the game with the parameters of a new scene
    //
    _setActions(ActionStatus.isAction, false);
    _setActions(ActionStatus.isAction, false);
    return null;
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
  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  // Setting page status when loading data
  void _setStatusPage(StatusContent val) {
    statusPage = val;
    notifyListeners();
  }
}
