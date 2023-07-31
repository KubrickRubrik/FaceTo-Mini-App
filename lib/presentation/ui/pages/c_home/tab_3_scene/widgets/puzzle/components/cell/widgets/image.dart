part of '../../../puzzle.dart';

/// Cell image display widget
class _ImageCellPuzzle extends StatelessWidget {
  const _ImageCellPuzzle(this.index, this.typeList);
  final int index;
  final TypeListCellsPuzzle typeList;
  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({int idScene, double xOffset, double yOffset})>(
      selector: (_, Model) => (
        idScene: Model.pageData.puzzle.scene.useIdScene,
        xOffset: Model.pageData.puzzle.cells.getCorrectList(typeList).elementAt(index).image.xOffset,
        yOffset: Model.pageData.puzzle.cells.getCorrectList(typeList).elementAt(index).image.yOffset,
      ),
      builder: (_, model, __) {
        final scene = context.read<SceneProvider>().pageData.puzzle.scene;
        return Positioned(
          top: model.yOffset,
          bottom: 0,
          left: model.xOffset,
          right: 0,
          child: ComponentImage(
            typeCache: TypeCacheImage.notCache,
            targetSourceImage: TargetSourceImage.scenes,
            typeSourceImage: scene.imageScene.typeSourceImage,
            imagePath: scene.imageScene.url,
            idSeries: scene.useIdSeries,
            idScene: scene.useIdScene,
            idImage: scene.imageScene.idImage,
            alignment: Alignment.topLeft,
            fit: BoxFit.none,
          ),
        );
      },
    );
  }
}
