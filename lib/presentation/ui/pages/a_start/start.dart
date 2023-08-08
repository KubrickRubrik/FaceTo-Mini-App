import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/localization/controller.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:device_preview/device_preview.dart';
import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/ui/navigator/navigator.dart';
import 'package:flutter_gen/gen_l10n/app_loc.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<SessionProvider>(),
      builder: (context, _) {
        final sessionUser = context.read<SessionProvider>().sessionUser;
        print("START");
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemesController.set(sessionUser.settings.theme),
          locale: LocalizationController.getByType(sessionUser.settings.locale),
          supportedLocales: AppLocalization.supportedLocales,
          localizationsDelegates: AppLocalization.localizationsDelegates,
          // title: (context.nlcz != null) ? context.nlcz!.titleApp : 'New', //  "FaceTo Mini",
          routerConfig: PagesNavigator.goRoutes(sessionUser.stateAuthorization),
          // builder: DevicePreview.appBuilder,
          scrollBehavior: AppScrollBehavior(),
        );
      },
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
