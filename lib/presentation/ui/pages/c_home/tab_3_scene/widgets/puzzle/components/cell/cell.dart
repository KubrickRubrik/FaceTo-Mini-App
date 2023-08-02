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
            //? Helper (Only used for main cells)
            if (typeList == TypeListCellsPuzzle.main) _HelperCellPuzzle(index, typeList),
            //
            MyWidget(index, typeList),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget(
    this.index,
    this.typeList,
  );

  final int index;
  final TypeListCellsPuzzle typeList;

  @override
  Widget build(BuildContext context) {
    final cell = context.read<SceneProvider>().pageData.puzzle.cells.getCorrectList(typeList).elementAt(index);
    return Stack(
      children: [
        //! Key
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xDA000000),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "K: " + cell.keyCell.toString(),
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        //! Pos
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xDA000000),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "P: " + cell.idPositionCell.toString(),
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
        //! Index
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            height: 30,
            // width: 30,
            decoration: BoxDecoration(
              color: const Color(0xDA000000),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "I: " + cell.idIndexCell.toString(),
              style: const TextStyle(color: Color(0xFF4FF321), fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
