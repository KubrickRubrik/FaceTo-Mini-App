part of 'winners.dart';

mixin _State {
  final dataPage = _DataPage();
  // Load page
  var actionStatus = ActionStatus.isDone;
  final status = _StatusPages();
}

final class _DataPage {
  final winners = _Winners();
  final source = _Source();
  int idSource = 0;
  var type = TypeWinnersSource.series;
  var isDisplayStat = false;
}
