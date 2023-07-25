import 'package:flutter/material.dart';
import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';

class PageTabScene extends StatelessWidget {
  const PageTabScene({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<PagesControllerProvider>().swipeToScenes();
        print('SWIPE TO PAGE SCENE');
      },
      child: const Placeholder(),
    );
  }
}
