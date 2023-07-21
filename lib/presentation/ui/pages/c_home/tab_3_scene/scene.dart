import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/manager/controller_page/controller_pages.dart';
import 'package:flutter/material.dart';

class PageTabScene extends StatelessWidget {
  const PageTabScene({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<ControllerPagesProvider>().swipeToScenes(1);
        // _FMD_CONTROLLER.setContentTab_2_SWIPE();
        // context.goNamed('series', pathParameters: {'page': "2"});
        print('LEFT');
      },
      child: Placeholder(),
    );
  }
}
