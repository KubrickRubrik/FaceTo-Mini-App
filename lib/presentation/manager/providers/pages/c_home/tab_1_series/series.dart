import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/vo/series.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/domain/use_cases/series.dart';
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
      print(response.fail?.msg);
      _setStatusPage(StatusContent.isNoneContent);
    } else {
      pageData.overwritingPageData(response.data!);
      _setStatusPage(StatusContent.isViewContent);
    }
  }

  // Game series statistics update after solving a puzzle
  void updateSeries(PuzzleUpdatesEntity updateData) {
    for (final series in pageData.listSeries) {
      if (series.idSeries == updateData.series.idSeires) {
        series.user.stat.completed = updateData.series.completed;
        series.stat.timeRecord = updateData.series.timeRecord;
        break;
      }
    }
    notifyListeners();
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
