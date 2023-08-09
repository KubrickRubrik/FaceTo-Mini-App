import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:provider/provider.dart';

class LoadPageScenes extends StatelessWidget {
  const LoadPageScenes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<SessionProvider, CurrentThemeApp>(
        selector: (_, Model) => Model.sessionUser.settings.theme,
        builder: (_, theme, __) {
          final image = switch (theme) {
            CurrentThemeApp.light => AppImages.spinDark,
            _ => AppImages.spinLight,
          };
          return Image.asset(
            image,
            width: 30,
            height: 30,
          );
        },
      ),
    );
  }
}
