import 'package:flutter/material.dart';
part 'state.dart';

final class PagesControllerProvider extends ChangeNotifier with _State {
  // Init default parameters
  void initDefaultParameters(PageController controller, Size size) {
    _pageController = controller;
    _sizePanelScene = SizePanelScene(size);
  }

  // Swipe page/tab in any direction
  void _swipeToTab(int index) {
    indexTab = index;
    _pageController!.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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
