import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:provider/provider.dart';

class LoadingScene extends StatelessWidget {
  const LoadingScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, StatusContent>(
      selector: (_, Model) => Model.pageData.puzzle.status.statusLoadingGame,
      builder: (_, statusPage, child) {
        return switch (statusPage) {
          StatusContent.isViewContent => const SizedBox.shrink(),
          _ => child!,
        };
      },
      child: Center(
        child: Text(
          context.lcz.loadingScene,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
