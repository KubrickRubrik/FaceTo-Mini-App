import 'package:flutter/material.dart';
import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';

class PageTabScene extends StatelessWidget {
  const PageTabScene({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<PageControllerProvider>().swipeToScenes(1);
        // _FMD_CONTROLLER.setContentTab_2_SWIPE();
        // context.goNamed('series', pathParameters: {'page': "2"});
        print('LEFT');
      },
      child: Placeholder(),
    );
  }
}
