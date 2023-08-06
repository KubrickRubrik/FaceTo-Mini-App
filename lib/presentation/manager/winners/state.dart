part of 'winners.dart';

mixin _State {
  final dataPage = _DataPage();
  // Load page
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isNoneContent;
}

final class _DataPage {
  int idSource = 0;
  var type = TypeWinnersSource.series;
  var isDisplayStat = false;
}
