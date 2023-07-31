part of '../../puzzle.dart';

class _AdditionalCellsControllerPuzle extends StatelessWidget {
  const _AdditionalCellsControllerPuzle({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({int idScene, int lenghtTop, int lenghtBottom, int lenghtLeft, int lenghtRight})>(
      selector: (_, Model) => (
        idScene: Model.pageData.puzzle.scene.useIdScene,
        lenghtTop: Model.pageData.puzzle.cells.additionalCells.listTopAdditionalCells.length,
        lenghtBottom: Model.pageData.puzzle.cells.additionalCells.listBottomAdditionalCells.length,
        lenghtLeft: Model.pageData.puzzle.cells.additionalCells.listLeftAdditionalCells.length,
        lenghtRight: Model.pageData.puzzle.cells.additionalCells.listRightAdditionalCells.length,
      ),
      builder: (_, model, __) {
        final listCells = [
          ..._makeAdditionalCells(model.lenghtTop, TypeListCellsPuzzle.topSide),
          ..._makeAdditionalCells(model.lenghtBottom, TypeListCellsPuzzle.bottomSide),
          ..._makeAdditionalCells(model.lenghtLeft, TypeListCellsPuzzle.leftSide),
          ..._makeAdditionalCells(model.lenghtRight, TypeListCellsPuzzle.rightSide),
        ];
        return Stack(
          children: List.generate(listCells.length, (index) {
            return listCells[index];
          }),
        );
      },
    );
  }

  // Creating additional cell widget lists
  List<Widget> _makeAdditionalCells(int length, TypeListCellsPuzzle typeList) {
    return List.generate(length, (index) {
      return _ItemCellPuzzle(index, typeList);
    });
  }
}
