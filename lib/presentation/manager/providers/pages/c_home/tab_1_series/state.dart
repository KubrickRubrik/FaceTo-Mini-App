part of 'series.dart';

mixin _State {
  final pageData = _PageData();
  //
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isLoadContent;
  var statusContentPage = StatusContent.isNoneContent;
}

final class _PageData {
  final listSeries = <SeriesEntity>[];

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(List<SeriesEntity> data) {
    listSeries.clear();
    listSeries.addAll(data);
  }
}
