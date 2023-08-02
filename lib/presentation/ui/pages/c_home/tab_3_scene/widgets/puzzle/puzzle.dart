import 'dart:math';

import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:provider/provider.dart';
part 'widgets/main_cells/controller.dart';
part 'widgets/additional_cells/controller.dart';
part 'widgets/diagonal_cells/controller.dart';
// Cells layout
part 'components/cell/cell.dart';
part 'components/cell/widgets/image.dart';
part 'components/cell/widgets/helper.dart';

class PuzzleSection extends StatelessWidget {
  const PuzzleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //! Used to get the start coordinates of the start of a swipe
        onHorizontalDragDown: (details) {
          final puzzle = context.read<SceneProvider>().pageData.puzzle;
          // Touched the screen and can move horizontally.
          if (!puzzle.status.isAvailableSwipe) {
            // If the puzzle is shifted, the puzzle swipe is unavailable
            return;
          }
          puzzle.swipe.coord.setStartCoord(Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          ));
        },
        //! Used to get the end coordinates of a swipe while moving horizontally
        //! Puzzle shift starts
        onHorizontalDragUpdate: (details) {
          final puzzle = context.read<SceneProvider>().pageData.puzzle;
          // Touched screen moves horizontally
          if (!puzzle.status.isAvailableSwipe) {
            // If the puzzle is shifted, the puzzle swipe is unavailable
            return;
          }
          Future.delayed(const Duration(milliseconds: 30), () {});
          puzzle.swipe.coord.setEndCoord(Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          ));
        },
        //! Used to get the end coordinates of a swipe while moving vertically
        //! Puzzle shift starts
        onVerticalDragUpdate: (details) {
          final puzzle = context.read<SceneProvider>().pageData.puzzle;
          // Touched the screen with the main button moves vertically.
          if (!puzzle.status.isAvailableSwipe) {
            // If the puzzle is shifted, the puzzle swipe is unavailable
            return;
          }
          puzzle.swipe.coord.setEndCoord(Offset(
            details.localPosition.dx,
            details.localPosition.dy,
          ));
        },
        onHorizontalDragEnd: (details) {
          final puzzle = context.read<SceneProvider>().pageData.puzzle;
          // Touched screen moves horizontally
          if (!puzzle.status.isAvailableSwipe) {
            // If the puzzle is shifted, the puzzle swipe is unavailable
            return;
          }
          // Run shift puzzle
          context.read<SceneProvider>().runShift();
        },
        onVerticalDragEnd: (details) {
          final puzzle = context.read<SceneProvider>().pageData.puzzle;
          // Touched screen moves horizontally
          if (!puzzle.status.isAvailableSwipe) {
            // If the puzzle is shifted, the puzzle swipe is unavailable
            return;
          }
          // Run shift puzzle
          context.read<SceneProvider>().runShift();
        },

        child: Selector<SceneProvider, (double, double)>(
          selector: (_, Model) => (
            Model.pageData.puzzle.playArea.sizePlayArea.heightPlayArea,
            Model.pageData.puzzle.playArea.sizePlayArea.widthPlayArea,
          ),
          builder: (_, model, child) {
            return SizedBox(
              height: model.$1,
              width: model.$2,
              child: child!,
            );
          },
          child: const Stack(
            children: [
              //? Main puzzle cells (rows and columns)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: _MainCellsControllerPuzle(),
              ),
              //? Additional puzzle cells (rows and columns)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: _AdditionalCellsControllerPuzle(),
              ),
              //? Additional puzzle cells (diagonals)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: _DiagonalCellsControllerPuzle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
