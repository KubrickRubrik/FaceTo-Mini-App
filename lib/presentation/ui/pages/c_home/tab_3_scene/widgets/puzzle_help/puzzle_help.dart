import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:flutter/material.dart';
part "widgets/grid.dart";
part 'widgets/hardlevel.dart';
part 'widgets/help.dart';

class PuzzleHelpSection extends StatelessWidget {
  const PuzzleHelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        //  height: (MediaQuery.of(context).size.height - Provider.of<SceneBloc>(context).hSizeBar - 30) / 2,
        height: 60,
        child: Center(
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
  const _SpacerDot({super.key});

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
