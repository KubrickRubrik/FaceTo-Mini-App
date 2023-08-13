import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_info.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_sound.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_language.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_theme.dart';
import 'package:provider/provider.dart';

class SettingsBar extends StatelessWidget {
  const SettingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<SessionProvider, bool>(
        selector: (_, Model) => Model.sessionUser.settings.isViewMenu,
        builder: (_, isViewMenu, child) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.ease,
            crossFadeState: (!isViewMenu) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const SizedBox.shrink(),
            secondChild: child!,
          );
        },
        child: const _Menu(),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SessionProvider>().setViewMenuSettings();
      },
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 70, bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            child: const SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ItemSettingsTheme(),
                  ItemSettingsLanguage(),
                  ItemSettingsSound(),
                  ItemSettingsInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
