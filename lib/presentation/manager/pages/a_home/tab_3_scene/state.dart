part of 'scene.dart';

mixin _State {
  final pageData = _PageData();
  //
  var actionStatus = ActionStatus.isDone;
  var statusPage = StatusContent.isNoneContent;
  final statusAdditionPages = _StatusAdditionPages();
}

/// Class for basic page data
final class _PageData {
  // var sceneEntity = SceneEntity();
  // Last used scene
  int useIdScene = -1;
  // Old (previously loaded) data will be returned if idScene has not changed
  bool isOldSceneUsed(int idNewSeires) => useIdScene == idNewSeires;
  // Overwriting the used idScene and clean for new data
  void overwritingPageData(int idScene, SceneEntity data) {
    useIdScene = idScene;
  }
}

/// Class for tracking the status of additional pages
final class _StatusAdditionPages {
  // High-resolution image display
  var statusDisplayImageHD = StatusContent.isNoneContent;
  // Display winners page
  var statusWinnerPage = StatusContent.isNoneContent;
  //
  var statusSourceWinner = TypeSourceWinner.offline;
  // var statusSpinSaveWinner = StatusContent.isNoneContent;
}
