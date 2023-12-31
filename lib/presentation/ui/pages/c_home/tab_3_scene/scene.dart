import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/image_hd.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/loading.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/puzzle/puzzle.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/puzzle_help/puzzle_help.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/winner.dart';

class PageTabScene extends StatelessWidget {
  const PageTabScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFffffff),
        gradient: RadialGradient(
          radius: 1,
          colors: [
            Color.fromARGB(255, 94, 113, 123),
            Color(0xFF000000),
          ],
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: const Stack(
          children: [
            //? Loading scene
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: LoadingScene(),
            ),
            //? Content
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: PuzzleSection(),
            ),
            //? Help
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PuzzleHelpSection(),
            ),
            //? View image
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ImageSceneAdditionPage(),
            ),
            //? Winner
            Positioned(
              top: 50,
              bottom: 0,
              left: 0,
              right: 0,
              child: WinnerAdditionPage(),
            ),
          ],
        ),
      ),
    );
  }
}
