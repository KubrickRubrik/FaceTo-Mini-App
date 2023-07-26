import 'package:facetomini/domain/entities/vo/series.dart';
import 'package:facetomini/domain/use_cases/series.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class SeriesProvider extends ChangeNotifier with _State {
  SeriesProvider(this._seriesCase);
  final SeriesCase _seriesCase;

  // Series request
  Future<void> getSeries() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final response = await _seriesCase.getSeries();
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      _setStatusPage(StatusContent.isNoneContent);
    } else {
      pageData.overwritingPageData(response.data!);
      _setStatusPage(StatusContent.isViewContent);
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

  // // Setting page content status when data is loaded
  void _setStatusContentPage(StatusContent val) {
    statusContentPage = val;
    notifyListeners();
  }
}
