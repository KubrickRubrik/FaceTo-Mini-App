import 'package:facetomini/presentation/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_1_series/widgets/load_content.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_1_series/widgets/list_content/list.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_1_series/widgets/no_content.dart';
import 'package:provider/provider.dart';

class PageTabSeries extends StatefulWidget {
  const PageTabSeries({super.key});

  @override
  State<PageTabSeries> createState() => _PageTabSeriesState();
}

class _PageTabSeriesState extends State<PageTabSeries> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final scrollController = ScrollController();
  double swipeVector = 0.0;

  @override
  void initState() {
    print("INIT SERIES");

    super.initState();
  }

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
          if (context.read<SeriesProvider>().actionStatus != ActionStatus.isDone) return;
          context.read<PagesControllerProvider>().swipeToScenes(1);
          // _FMD_CONTROLLER.setContentTab_2_SWIPE();
          print('RIGHT');
        } else {
          // TO LEFT TAB_2
          // print('LEFT');
        }
        swipeVector = details.localPosition.dx;
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF745291), Color(0xFF1b1e53)],
          ),
        ),
        alignment: Alignment.topCenter,
        child: Selector<SeriesProvider, StatusContent>(
          selector: (_, Model) => Model.statusPage,
          builder: (_, statusPage, child) {
            return switch (statusPage) {
              StatusContent.isLoadContent => const LoadPageSeries(),
              StatusContent.isEmptyContent || StatusContent.isNoContent => const NoContentPageSeries(),
              _ => ListContentSeries(controller: scrollController),
            };
          },
        ),
      ),
    );
  }
}
