part of 'controller.dart';

mixin _State {
  TabController? _tabController;
  SizePanelScene? _sizePanelScene;
  int indexTab = 0;
  SizePanelScene get sizePanelScene => _sizePanelScene!;
}

/// The class responsible for setting the dimensions of the mosaic panel
final class SizePanelScene {
  SizePanelScene(Size size)
      : height = size.height,
        width = size.width;

  final double height;
  final double width;
}
