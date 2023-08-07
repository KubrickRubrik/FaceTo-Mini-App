part of 'scenes.dart';

mixin _State {
  final pageData = _PageData();
  //
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isNoneContent;
}

final class _PageData {
  // Last used series
  int useIdSeries = -1;
  // List of all series
  final listScenes = <SceneEntity>[];
  // Old (previously loaded) data will be returned if idSeries has not changed
  bool isOldSeriesUsed(int idNewSeires) => useIdSeries == idNewSeires;

  // Overwriting the used idSeries and clean for new data
  void overwritingPageData(int idSeries, List<SceneEntity> data) {
    useIdSeries = idSeries;
    listScenes.clear();
    listScenes.addAll(data);
  }

  //
  int get countScene => listScenes.length;
}
