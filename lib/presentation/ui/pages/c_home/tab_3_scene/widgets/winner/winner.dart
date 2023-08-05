import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/buttons.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:provider/provider.dart';

/// Widget to show/hide the winners page
class WinnerAdditionPage extends StatelessWidget {
  const WinnerAdditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, StatusContent>(
      selector: (_, Model) => Model.statusAdditionPages.winnerPage,
      builder: (_, statusWinnerPages, __) {
        return switch (statusWinnerPages) {
          StatusContent.isViewContent || StatusContent.isLoadContent => const _ControllerLoadingWinnerPage(),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

/// Winners page widget to display navigation buttons and loading controller
class _ControllerLoadingWinnerPage extends StatelessWidget {
  const _ControllerLoadingWinnerPage();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SceneProvider>().displayImagePage();
      },
      child: Container(
        color: const Color(0xCC000000),
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: 350,
          decoration: BoxDecoration(
            color: const Color(0xFFffffff),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //? Controller loading
                ControllerWinnerSection(),
                //? Buttons navigation winner page
                ButtonsWinnerPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
