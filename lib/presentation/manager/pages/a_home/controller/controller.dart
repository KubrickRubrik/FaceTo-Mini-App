import 'package:facetomini/core/config/entity.dart';
import 'package:flutter/material.dart';
part 'state.dart';

final class PagesControllerProvider extends ChangeNotifier with _State {
  // Init default parameters
  void initDefaultParameters(TabController controller, Size size) {
    _tabBarController = controller;
    _sizePanelScene = SizePanelScene(size);
  }

  // Swipe page/tab in any direction
  void _swipeToTab(int index) {
    indexTab = index;
    _tabBarController?.animateTo(index);
    notifyListeners();
  }

  Future<void> swipeToSeries() async {
    _swipeToTab(0);
    // await Future.delayed(Duration(milliseconds: 150)).then((value) {
    //   APP_AUDIO.soundToScenes();
    // });
  }

  Future<void> swipeToScenes() async {
    _swipeToTab(1);
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

  // Displaying the series rating information page
  void setViewInfoRatingPage() {
    viewAdditionalPage.setViewInfoRatingPage();
    notifyListeners();
  }

  // Displaying the author information page
  void setViewInfoAuthorPage() {
    viewAdditionalPage.setViewInfoAuthorPage();
    notifyListeners();
  }

  // Displaying the winners information page
  void setViewInfoWinnersPage() {
    viewAdditionalPage.setViewInfoWinnersPage();
    notifyListeners();
  }
}
