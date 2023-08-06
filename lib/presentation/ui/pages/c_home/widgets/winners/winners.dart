import 'package:facetomini/presentation/ui/pages/c_home/widgets/winners/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/winners/widgets/list_content/list.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/winners/widgets/load_content.dart';
import 'package:facetomini/core/config/links.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/winners/winners.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
part 'widgets/none_winners.dart';

class ComponentWinners extends StatelessWidget {
  const ComponentWinners({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WinnersProvider, StatusContent>(
      selector: (_, Model) => Model.statusPage,
      builder: (_, statusPage, __) {
        return switch (statusPage) {
          StatusContent.isViewContent || StatusContent.isLoadContent => const _ViewPage(),
          _ => const SizedBox.shrink(),
        };
      },
      child: const SizedBox(),
    );
  }
}

class _ViewPage extends StatelessWidget {
  const _ViewPage();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<WinnersProvider>().closeWinners();
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xCC000000),
        ),
        child: Selector<WinnersProvider, StatusContent>(
          selector: (_, Model) => Model.statusPage,
          builder: (_, statePage, __) {
            return switch (statePage) {
              StatusContent.isLoadContent => const LoadWinnersPage(),
              StatusContent.isViewContent => const ListContentWinners(),
              _ => const NoneViewWinnersPage(),
            };
          },
        ),
      ),
    );
  }
}
