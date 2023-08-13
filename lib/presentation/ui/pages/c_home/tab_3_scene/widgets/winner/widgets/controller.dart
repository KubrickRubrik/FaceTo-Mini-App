import 'package:flutter/material.dart';

import 'package:facetomini/presentation/ui/pages/c_home/widgets/item_winner/item.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/links.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/widgets/online/winners/item_author/item.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/widgets/offline/widgets/places.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/widgets/offline/widgets/stat.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
part 'widgets/online/online.dart';
part 'widgets/offline/offline.dart';

/// The download controller changes the section before loading and displaying content.
class ControllerWinnerSection extends StatelessWidget {
  const ControllerWinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, StatusContent>(
      selector: (_, Model) => Model.statusAdditionPages.winnerPage,
      builder: (_, statusWinnerPage, child) {
        return switch (statusWinnerPage) {
          StatusContent.isLoadContent => const _SpinLoadingScetion(),
          StatusContent.isViewContent => child!,
          _ => const SizedBox.shrink(),
        };
      },
      child: const _ControllerSourceWinner(),
    );
  }
}

/// Spin widget
class _SpinLoadingScetion extends StatelessWidget {
  const _SpinLoadingScetion();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Image.asset(
          AppImages.spinDark,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}

/// The content controller determines whether the winners section is shown offline or online.
class _ControllerSourceWinner extends StatelessWidget {
  const _ControllerSourceWinner();

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, bool>(
      selector: (_, Model) => Model.pageData.winner.data.isOnline,
      builder: (_, isOnline, __) {
        return switch (isOnline) {
          false => const _OfflineWinnerSection(),
          true => const _OnlineWinnerSection(),
        };
      },
    );
  }
}
