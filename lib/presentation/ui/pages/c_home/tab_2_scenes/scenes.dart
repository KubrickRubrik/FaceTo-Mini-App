import 'package:facetomini/presentation/manager/pages/a_home/tab_2.scenes/scenes.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_2_scenes/widgets/list_content/list.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_2_scenes/widgets/load_content.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_2_scenes/widgets/no_content.dart';
import 'package:facetomini/presentation/locator/locator.dart';
import 'package:provider/provider.dart';

class PageTabScenes extends StatefulWidget {
  const PageTabScenes({super.key});

  @override
  State<PageTabScenes> createState() => _PageTabScenesState();
}

class _PageTabScenesState extends State<PageTabScenes> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final scrollController = ScrollController();
  double swipeVector = 0.0;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragDown: (details) {
        swipeVector = details.localPosition.dx;
      },
      onHorizontalDragStart: (details) {
        // TO RIGHT TAB_1
        if (details.localPosition.dx < swipeVector) {
          locator<PageControllerProvider>().swipeToScenes(2);
          print('RIGHT');
        }
        // TO LEFT TAB_2
        else {
          locator<PageControllerProvider>().swipeToScenes(0);
          print('LEFT');
        }
        swipeVector = details.localPosition.dx;
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFD500), Color(0xFFFE7B00)],
          ),
        ),
        alignment: Alignment.topCenter,
        child: Selector<ScenesProvider, StatusContent>(
          selector: (_, Model) => Model.statusPage,
          builder: (_, statusPage, child) {
            return switch (statusPage) {
              StatusContent.isLoadContent => const LoadPageScenes(),
              StatusContent.isEmptyContent || StatusContent.isNoContent => const NoContentPageScenes(),
              _ => ListContentScenes(controller: scrollController),
            };
          },
        ),
      ),
    );
  }
}
