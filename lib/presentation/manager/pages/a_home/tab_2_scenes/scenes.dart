// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/domain/use_cases/scenes.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class ScenesProvider extends ChangeNotifier with _State {
  ScenesProvider(this._scenesCase);
  final ScenesCase _scenesCase;

  Future<bool?> getScenes(int idSeries) async {
    print("GET scene of SERIES $idSeries");
    if (super.actionStatus == ActionStatus.isAction) return null;
    // Return old data if condition is met
    if (pageData.isOldSeriesUsed(idSeries)) return true;
    // Load new data scene for use series
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final response = await _scenesCase.getScenesInSeries(idSeries);
    _setActions(ActionStatus.isDone, false);
    // Result processing
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      _setStatusPage(StatusContent.isNoneContent);
      return false;
    } else {
      pageData.overwritingPageData(idSeries, response.data!);
      _setStatusPage(StatusContent.isViewContent);
      return true;
    }
  }

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

  // Checking the completion status of the previous scene to open the next one
  bool isCompletedPreviousScene(int index) {
    if (index == 0) return true;
    return pageData.listScenes.elementAt(index - 1).user.stat.completed == 1;
  }
}
