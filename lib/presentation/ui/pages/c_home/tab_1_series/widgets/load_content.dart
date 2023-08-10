import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:provider/provider.dart';

class LoadPageSeries extends StatelessWidget {
  const LoadPageSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<SessionProvider, CurrentThemeApp>(
        selector: (_, Model) => Model.sessionUser.settings.theme,
        builder: (_, theme, __) {
          return Image.asset(
            AppImages.spinLight,
            width: 40,
            height: 40,
          );
        },
      ),
    );
  }
}
