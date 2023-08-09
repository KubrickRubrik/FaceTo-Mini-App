import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/sound/sound.dart';
import 'package:flutter/material.dart';
part 'state.dart';

final class PagesControllerProvider extends ChangeNotifier with _State {
  // Init default parameters
  void initDefaultParameters(TabController controller, Size size) {
    _tabBarController = controller;
  }

  // Swipe page/tab in any direction
  void _swipeToTab(int index) {
    indexTab = index;
    _tabBarController?.animateTo(index);
    notifyListeners();
  }

  Future<void> swipeToScenes() async {
    _swipeToTab(1);
    await locator<SoundController>().playScenes();
  }

  Future<void> swipeToScene() async {
    _swipeToTab(2);
    await locator<SoundController>().playScene();
  }

  // Swipe only to previous page/tab
  Future<void> swipeBack() async {
    _swipeToTab(indexTab - 1);
    await locator<SoundController>().playBack();
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
