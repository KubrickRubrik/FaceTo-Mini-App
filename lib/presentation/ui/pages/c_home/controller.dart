import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/sound/sound.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/author/author.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/winners/winners.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/author/author.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/winners/winners.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/info_rating.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/settings_panel.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (super.mounted) {
        // Set default parameters
        locator<PagesControllerProvider>().initDefaultParameters(tabController);
        // Get series
        locator<SeriesProvider>().getSeries();
        locator<SoundController>().playSeries();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    print("Dispose");
    locator<PagesControllerProvider>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiProvider(
          providers: [
            // ChangeNotifierProvider(create: (_) => locator<PagesControllerProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<SeriesProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<ScenesProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<SceneProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<AuthorProvider>()),
            // ChangeNotifierProvider(create: (_) => locator<WinnersProvider>()),
            ChangeNotifierProvider.value(value: locator<PagesControllerProvider>()),
            ChangeNotifierProvider.value(value: locator<SeriesProvider>()),
            ChangeNotifierProvider.value(value: locator<ScenesProvider>()),
            ChangeNotifierProvider.value(value: locator<SceneProvider>()),
            ChangeNotifierProvider.value(value: locator<AuthorProvider>()),
            ChangeNotifierProvider.value(value: locator<WinnersProvider>()),
          ],
          child: Stack(
            children: [
              TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  PageTabSeries(),
                  PageTabScenes(),
                  PageTabScene(),
                ],
              ),
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
              const Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InfoRatingApp(),
              ),
              //! Winners
              const Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: ComponentWinners(),
              ),
              //! Author page
              const Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: ComponentAuthor(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
