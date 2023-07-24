import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/session/session.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_info.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_sound.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_language.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/app_bar/settings_panel/widgets/item_theme.dart';
import 'package:provider/provider.dart';

class SettingsBar extends StatelessWidget {
  const SettingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SessionProvider, bool>(
      selector: (_, Model) => Model.sessionUser.settings.isViewMenu,
      builder: (_, isViewMenu, child) {
        return AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.ease,
            crossFadeState: (!isViewMenu) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const SizedBox.shrink(),
            secondChild: child!);
      },
      child: menu(context),
    );
  }

  //
  Widget menu(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SessionProvider>().setViewMenuSettings();
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50, top: 70, bottom: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 2,
                spreadRadius: -2,
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: const SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ItemSettingsTheme(),
                ItemLanguageTheme(),
                ItemSoundTheme(),
                ItemInfoTheme(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}