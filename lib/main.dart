import 'package:facetomini/presentation/sound/sound.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/session/session.dart';
import 'package:facetomini/presentation/ui/pages/a_start/start.dart';
import 'package:facetomini/presentation/locator/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.setup();
  await locator<SoundController>().init();
  await locator<SessionProvider>().authorization();
  runApp(const StartPage());
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     // tools: [
  //     //   ...DevicePreview.defaultTools,
  //     // ],
  //     builder: (context) => const StartPage(),
  //   ),
  // );
}
