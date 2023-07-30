part of '../puzzle.dart';

class _MainCellsPuzle extends StatelessWidget {
  const _MainCellsPuzle({super.key});

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
            return _ItemMainCell(index);
          }),
        );
      },
    );
  }
}

class _ItemMainCell extends StatelessWidget {
  const _ItemMainCell(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({double xCoord, double yCoord, int duration})>(
      selector: (_, Model) => (
        xCoord: Model.pageData.puzzle.cells.listMainCell.elementAt(index).xCoord,
        yCoord: Model.pageData.puzzle.cells.listMainCell.elementAt(index).yCoord,
        duration: Model.pageData.puzzle.cells.listMainCell.elementAt(index).duration
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
            _ImageMainCell(index),
            // Positioned(
            //   top: 0,
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: _ImageMainCell(index),
            // ),
            //? Help
            _HelpMainCell(index),
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

/// Cell image display widget
class _ImageMainCell extends StatelessWidget {
  const _ImageMainCell(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({int idScene, double xOffset, double yOffset})>(
      selector: (_, Model) => (
        idScene: Model.pageData.puzzle.scene.useIdScene,
        xOffset: Model.pageData.puzzle.cells.listMainCell.elementAt(index).image.xOffset,
        yOffset: Model.pageData.puzzle.cells.listMainCell.elementAt(index).image.yOffset,
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

/// Cell tooltip display widget
class _HelpMainCell extends StatelessWidget {
  const _HelpMainCell(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Selector<SceneProvider, ({bool isDisplayHelp, int duration})>(
      selector: (_, Model) => (
        isDisplayHelp: Model.pageData.puzzle.cells.listMainCell.elementAt(index).isDisplayHelper,
        duration: Model.pageData.puzzle.cells.listMainCell.elementAt(index).duration,
      ),
      builder: (_, model, child) {
        final maxHelperSize = context.read<SceneProvider>().pageData.puzzle.playArea.sizeCell.maxHelperSize;
        return AnimatedOpacity(
          duration: Duration(milliseconds: model.duration + 100),
          curve: Curves.easeInOutBack,
          opacity: model.isDisplayHelp ? 1 : 0,
          child: Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: model.duration),
              curve: Curves.easeInOutBack,
              height: model.isDisplayHelp ? maxHelperSize : 0,
              width: model.isDisplayHelp ? maxHelperSize : 0,
              alignment: Alignment.center,
              child: child!,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          //? Helper
          RotatedBox(
            quarterTurns: Random().nextInt(4),
            child: Image.asset(
              AppImages.blot,
              color: const Color(0xFFFFAE00),
            ),
          ),
          //? Pointer icon
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                AppIcons.swipe,
                size: 25,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
