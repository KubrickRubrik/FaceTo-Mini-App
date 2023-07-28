import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
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
  void initState() {
    print("INIT SCENE");
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
          if (context.read<ScenesProvider>().actionStatus != ActionStatus.isDone) return;
          final listScenes = context.read<ScenesProvider>().pageData.listScenes;
          // Selects the first scene to run when swiping
          var idLastScene = listScenes.first.idScene;
          // Getting the last used scene or the first one on the scenes page for swiping
          final useIdScene = context.read<SceneProvider>().pageData.useIdScene;
          if (useIdScene != -1) {
            // Use the last used scene
            idLastScene = useIdScene;
          } else {
            // first run -> select the last completed element or the first from the list of scenes
            final lastIndex = listScenes.lastIndexWhere((element) => element.user.stat.completed == 1);
            if (lastIndex != -1 && (lastIndex + 1) < listScenes.length) {
              // if the last completed element is found, the next one is selected if it is in the scene list
              idLastScene = listScenes.elementAt(lastIndex + 1).idScene;
            }
          }
          //
          context.read<SceneProvider>().setScene(idLastScene).then((isDone) {
            if (isDone == null) return;
            if (!isDone) {
              // If the scene didn't load
              ToastMassage.toast(context, context.lcz.sceneNotAvailable, code: TypeMassage.error);
              return;
            }
            context.read<PagesControllerProvider>().swipeToScene();
          });
          print('SWIPE TO PAGE SCENE');
        }
        // TO LEFT TAB_2
        else {
          locator<PagesControllerProvider>().swipeToSeries();
          print('SWIPE TO PAGE SERIES');
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
              StatusContent.isEmptyContent || StatusContent.isNoneContent => const NoContentPageScenes(),
              _ => ListContentScenes(controller: scrollController),
            };
          },
        ),
      ),
    );
  }
}
