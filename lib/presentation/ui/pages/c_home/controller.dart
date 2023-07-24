import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/settings_panel.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/session/session.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';
part 'widgets/app_bar/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController tabController = TabController(length: 3, vsync: this);
  final PageController controller = PageController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (super.mounted) {
        // Set default parameters
        locator<PagesControllerProvider>().initDefaultParameters(
          controller,
          context.media.size,
        );
        // Get series
        locator<SeriesProvider>().getSeries();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    print("Dispose");
    // tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiProvider(
          providers: [
            // ChangeNotifierProvider(create: (_) => locator<ControllerPagesProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<SeriesProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<ScenesProvider>()),
            ChangeNotifierProvider.value(value: locator<PagesControllerProvider>()),
            ChangeNotifierProvider.value(value: locator<SeriesProvider>()),
            ChangeNotifierProvider.value(value: locator<ScenesProvider>()),
            ChangeNotifierProvider.value(value: locator<SceneProvider>()),
          ],
          child: Stack(
            children: [
              PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  if (value == 1) {
                    locator<ScenesProvider>().getScenes(1);
                  } else if (value == 2) {
                    // locator<SceneProvider>().getScenes();
                  }
                  print(value);
                },
                children: const [
                  PageTabSeries(),
                  PageTabScenes(),
                  PageTabScene(),
                ],
              ),
              // TabBarView(
              //   controller: tabController,
              //   physics: const NeverScrollableScrollPhysics(),
              //   children: const [
              //     PageTabSeries(),
              //     PageTabScenes(),
              //     PageTabScene(),
              //   ],
              // ),
              //! AppBar
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _AppBar(),
              ),
              //! Settings
              const Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: SettingsBar(),
              ),
              //! Info Rating app
              // if (Provider.of<ControllerBloc>(context).state_view_info_rating == ViewStatusPage.view_content)
              //   Positioned(
              //     top: 0,
              //     bottom: 0,
              //     left: 0,
              //     right: 0,
              //     child: InfoRatingApp(),
              //   ),
              //! Winners
              // if (Provider.of<CM_WinnersBloc>(context).stateViewPage == ViewStatusPage.view_content)
              //   Positioned(
              //     top: 0,
              //     bottom: 0,
              //     left: 0,
              //     right: 0,
              //     child: CM_Winners(),
              //   ),
              //! Author page
              // Positioned(
              //   top: 0,
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: CM_Author(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
