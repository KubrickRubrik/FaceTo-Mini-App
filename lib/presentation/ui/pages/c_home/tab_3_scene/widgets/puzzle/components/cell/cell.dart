part of '../../puzzle.dart';

class _ItemCellPuzzle extends StatelessWidget {
  const _ItemCellPuzzle(this.index, this.typeList);
  final int index;
  final TypeListCellsPuzzle typeList;
  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({double xCoord, double yCoord, int duration})>(
      selector: (_, Model) => (
        xCoord: Model.pageData.puzzle.cells.getCorrectList(typeList).elementAt(index).xCoord,
        yCoord: Model.pageData.puzzle.cells.getCorrectList(typeList).elementAt(index).yCoord,
        duration: Model.pageData.puzzle.cells.getCorrectList(typeList).elementAt(index).duration
      ),
      builder: (_, model, child) {
        // Changing cell position coordinates
        return AnimatedPositioned(
          duration: Duration(milliseconds: model.duration),
          curve: Curves.easeOutQuad,
          top: model.yCoord,
          left: model.xCoord,
          child: child!,
        );
      },
      child: Selector<SceneProvider, ({double width, double height})>(
        selector: (_, Model) => (
          width: Model.pageData.puzzle.playArea.sizeCell.widthCell,
          height: Model.pageData.puzzle.playArea.sizeCell.heightCell,
        ),
        builder: (_, model, child) {
          // Changing the geometric dimensions of a cell
          return Container(
            padding: EdgeInsets.all(context.read<SceneProvider>().pageData.puzzle.playArea.cellPadding),
            width: model.width,
            height: model.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                context.read<SceneProvider>().pageData.puzzle.playArea.cellRoundingRadius,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            child: child!,
          );
        },
        child: Stack(
          children: [
            //? Image cell
            _ImageCellPuzzle(index, typeList),
            // Positioned(
            //   top: 0,
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: _ImageMainCell(index),
            // ),
            //? Helper
            // Only used for main cells
            if (typeList == TypeListCellsPuzzle.main) _HelperCellPuzzle(index, typeList),
            // Positioned(
            //   top: 0,
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: _HelpMainCell(),
            // ),
          ],
        ),
      ),
    );
  }
}
