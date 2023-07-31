part of '../../puzzle.dart';

class _MainCellsControllerPuzle extends StatelessWidget {
  const _MainCellsControllerPuzle();

  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, (int, int)>(
      selector: (_, Model) => (
        Model.pageData.puzzle.scene.useIdScene,
        Model.pageData.puzzle.cells.listMainCell.length,
      ),
      builder: (_, model, __) {
        return Stack(
          children: List.generate(model.$2, (index) {
            return _ItemCellPuzzle(index, TypeListCellsPuzzle.main);
          }),
        );
      },
    );
  }
}
