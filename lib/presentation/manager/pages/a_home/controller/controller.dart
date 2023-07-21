import 'package:flutter/material.dart';
part 'state.dart';

final class PageControllerProvider extends ChangeNotifier with _State {
  PageControllerProvider() {
    print("INIT");
  }
  // Init default parameters
  void initDefaultParameters(TabController controller, Size size) {
    _tabController = controller;
    _sizePanelScene = SizePanelScene(size);
  }

  // Swipe page/tab in any direction
  void _swipeToTab(int index) {
    indexTab = index;
    _tabController!.animateTo(index);
    notifyListeners();
  }

  Future<void> swipeToScenes(int indexTab) async {
    // _FMD_SCENES.setContent(itemUseSeries);
    _swipeToTab(indexTab);
    // await Future.delayed(Duration(milliseconds: 150)).then((value) {
    //   APP_AUDIO.soundToScenes();
    // });
  }

  // Swipe only to previous page/tab
  Future<void> swipeBackTab(int index) async {
    _swipeToTab(index);
    // await APP_AUDIO.soundBack();
    // _FMD_SCENE.canselTimer();
  }
}
