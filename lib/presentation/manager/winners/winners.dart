import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/dto/winners.dart';
import 'package:facetomini/domain/use_cases/winners.dart';
part 'state.dart';

final class WinnersProvider extends ChangeNotifier with _State {
  WinnersProvider(this._winnersCase);
  final WinnersCase _winnersCase;

  /// Request series or scene winners
  Future<void> getWinners(int idSource, TypeWinnersSource type) async {
    if (dataPage.idSource == idSource && dataPage.type == type) {
      return;
    }
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final dto = WinnersDTO(idSource: idSource, type: type);
    final response = await _winnersCase.getWinners(dto);
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      _setStatusPage(StatusContent.isNoneContent);
    } else {
      // pageData.overwritingPageData(response.data!);
      _setStatusPage(StatusContent.isViewContent);
    }
  }

  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  // Page content display
  void _setStatusPage(StatusContent val) {
    statusPage = val;
    notifyListeners();
  }

  // Show statistics page
  void setDisplayInfoStat() {
    dataPage.isDisplayStat = !dataPage.isDisplayStat;
    notifyListeners();
  }

  // Closing the winners view page
  void closeWinners() {
    statusPage = StatusContent.isNoneContent;
    notifyListeners();
  }
}
