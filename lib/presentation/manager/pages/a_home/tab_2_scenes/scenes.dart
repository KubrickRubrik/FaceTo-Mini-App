import 'package:flutter/material.dart';
import 'package:facetomini/domain/use_cases/scenes.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class ScenesProvider extends ChangeNotifier with _State {
  ScenesProvider(this._scenesCase);
  final ScenesCase _scenesCase;

  Future<void> getScenes(int idSeries) async {
    print("GET SERIES");
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final response = await _scenesCase.getScenes(idSeries);
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      _setStatusPage(StatusContent.isNoContent);
    } else {
      _setStatusPage(StatusContent.isViewContent);
    }
  }

  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  // Setting page status when loading data
  void _setStatusPage(StatusContent val) {
    statusPage = val;
    notifyListeners();
  }

  // Setting page content status when data is loaded
  void _setStatusContentPage(StatusContent val) {
    statusContentPage = val;
    notifyListeners();
  }
}
