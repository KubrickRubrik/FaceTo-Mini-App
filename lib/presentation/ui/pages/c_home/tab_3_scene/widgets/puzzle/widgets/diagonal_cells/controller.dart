part of '../../puzzle.dart';

class _DiagonalCellsControllerPuzle extends StatelessWidget {
  const _DiagonalCellsControllerPuzle({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({int idScene, int lenghtLeftTop, int lenghtLeftBottom, int lenghtRightTop, int lenghtRightBottom})>(
      selector: (_, Model) => (
        idScene: Model.pageData.puzzle.scene.useIdScene,
        lenghtLeftTop: Model.pageData.puzzle.cells.additionalCells.additionalDiagonal.listLeftTopAdditionalDiagonal.length,
        lenghtLeftBottom: Model.pageData.puzzle.cells.additionalCells.additionalDiagonal.listLeftBottomAdditionalDiagonal.length,
        lenghtRightTop: Model.pageData.puzzle.cells.additionalCells.additionalDiagonal.listRightTopAdditionalDiagonal.length,
        lenghtRightBottom: Model.pageData.puzzle.cells.additionalCells.additionalDiagonal.listRightBottomAdditionalDiagonal.length,
      ),
      builder: (_, model, __) {
        final listCells = [
          ..._makeAdditionalCells(model.lenghtLeftTop, TypeListCellsPuzzle.leftTopDiagonal),
          ..._makeAdditionalCells(model.lenghtLeftBottom, TypeListCellsPuzzle.leftBottomDiagonal),
          ..._makeAdditionalCells(model.lenghtRightTop, TypeListCellsPuzzle.rightTopDiagonal),
          ..._makeAdditionalCells(model.lenghtRightBottom, TypeListCellsPuzzle.rightBottomDiagonal),
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
