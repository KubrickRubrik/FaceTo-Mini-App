part of 'controller.dart';

mixin _State {
  TabController? _tabBarController;
  SizePanelScene? _sizePanelScene;
  int indexTab = 0;
  SizePanelScene get sizePanelScene => _sizePanelScene!;
  final viewAdditionalPage = ViewAdditionalPage();
}

/// The class responsible for setting the dimensions of the mosaic panel
final class SizePanelScene {
  SizePanelScene(Size size)
      : height = size.height,
        width = size.width;

  final double height;
  final double width;
}

/// Class for storing display states of additional pages
final class ViewAdditionalPage {
  bool isViewInfoRatingPage = false;
  bool isViewInfoAuthorPage = false;
  bool isViewInfoWinnersPage = false;
  // Rating
  void setViewInfoRatingPage() {
    isViewInfoRatingPage = !isViewInfoRatingPage;
  }

  // Author
  void setViewInfoAuthorPage() {
    isViewInfoAuthorPage = !isViewInfoAuthorPage;
  }

  // Winners
  void setViewInfoWinnersPage() {
    isViewInfoWinnersPage = !isViewInfoWinnersPage;
  }
}
