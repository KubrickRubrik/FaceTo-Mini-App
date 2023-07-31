import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:provider/provider.dart';
part "widgets/grid.dart";
part 'widgets/hardlevel.dart';
part 'widgets/help.dart';

class PuzzleHelpSection extends StatelessWidget {
  const PuzzleHelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<SceneProvider, double>(
        selector: (_, Model) => Model.pageData.puzzle.playArea.sizePlayArea.heightPlayArea,
        builder: (_, heightBar, child) {
          return SizedBox(
            height: (MediaQuery.of(context).size.height - heightBar - 30) / 2,
            child: child!,
          );
        },
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Grid
              _GridScene(),
              //! Hard diagonal
              _SpacerDot(),
              _HardLevel(),
              //! Help
              _SpacerDot(),
              _ButtonHelp(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpacerDot extends StatelessWidget {
  const _SpacerDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: const Color(0xFF888888),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
