import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
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
          // If data is being loaded, the swipe is not available
          if (context.read<SeriesProvider>().actionStatus != ActionStatus.isDone || context.read<ScenesProvider>().actionStatus != ActionStatus.isDone) return;
          // Getting the last used series or the first one on the series page for swiping
          final useIdSeries = context.read<ScenesProvider>().pageData.useIdSeries;
          final idLastSeries = (useIdSeries != -1) ? useIdSeries : context.read<SeriesProvider>().listSeries.first.idSeries;

          context.read<ScenesProvider>().getScenes(idLastSeries).then((isDone) {
            if (isDone == null) return;
            if (!isDone) {
              // If the series does not have available prices
              ToastMassage.toast(context, context.lcz.scenesNotAvailable, code: TypeMassage.error);
              return;
            }
            context.read<PagesControllerProvider>().swipeToScenes();
          });
          print('SWIPE TO PAGE SCENES');
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
