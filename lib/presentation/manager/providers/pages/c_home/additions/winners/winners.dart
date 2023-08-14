import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/vo/winners.dart';
import 'package:facetomini/presentation/manager/entities/stat.dart';
import 'package:facetomini/domain/entities/vo/stat_puzzle.dart';
import 'package:facetomini/presentation/manager/entities/champion.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/dto/winners.dart';
import 'package:facetomini/domain/use_cases/winners.dart';
part 'state.dart';
part 'entity/status.dart';
part 'entity/source.dart';
part 'entity/champions.dart';

final class WinnersProvider extends ChangeNotifier with _State {
  WinnersProvider(this._winnersCase);
  final WinnersCase _winnersCase;

  /// Request series or scene winners
  Future<void> getWinners(int idSource, TypeWinnersSource type) async {
    if (super.actionStatus == ActionStatus.isAction) return;
    //
    dataPage.source.set(idSource: idSource, type: type);
    dataPage.winners._clear();
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final dto = WinnersDTO(idSource: idSource, type: type);
    final response = await _winnersCase.getWinners(dto);
    _setActions(ActionStatus.isDone, false);

    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      _setStatusPage(StatusContent.isNoneContent);
    } else {
      if (response.data!.listWinner.isEmpty) {
        _setStatusPage(StatusContent.isNoneContent);
      } else {
        dataPage.winners.set(response.data!);
      }
      _setStatusPage(StatusContent.isViewContent);
    }
  }

  /// Loading winners when scrolling through the list
  Future<void> getScrollData() async {
    print("SCROLL");
    if (super.actionStatus == ActionStatus.isAction) return;
    if (status.statusLoadWinners == StatusContent.isEmptyContent) return;
    _setActions(ActionStatus.isAction, false);
    _setStatusWinnersList(StatusContent.isLoadContent);
    final dto = WinnersDTO(
      idSource: dataPage.source.idSource,
      type: dataPage.source.type,
      idLast: dataPage.winners.listWinners.last.idApp,
    );
    final response = await _winnersCase.getWinners(dto);
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      _setStatusPage(StatusContent.isNoneContent);
      _setStatusWinnersList(StatusContent.isEmptyContent);
    } else {
      dataPage.winners.addScrollList(response.data!);
      _setStatusWinnersList(StatusContent.isViewContent);
    }
  }

  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  // Page content display
  void _setStatusPage(StatusContent val) {
    status.statusPage = val;
    notifyListeners();
  }

  // Show statistics page
  void setDisplayInfoStat() {
    dataPage.isDisplayStat = !dataPage.isDisplayStat;
    notifyListeners();
  }

  // Closing the winners view page
  void closeWinners() {
    status.statusPage = StatusContent.isNoneContent;
    notifyListeners();
  }

  void _setStatusWinnersList(StatusContent val) {
    status.statusLoadWinners = val;
    notifyListeners();
  }
}
