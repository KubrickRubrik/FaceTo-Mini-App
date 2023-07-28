part of 'scene.dart';

mixin _State {
  final pageData = _PageData();
  //
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isNoneContent;
  final statusAdditionPages = _StatusAdditionPages();
}
