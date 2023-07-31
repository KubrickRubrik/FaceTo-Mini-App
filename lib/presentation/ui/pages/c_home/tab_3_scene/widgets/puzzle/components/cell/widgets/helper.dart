part of '../../../puzzle.dart';

/// Cell tooltip display widget
class _HelperCellPuzzle extends StatelessWidget {
  const _HelperCellPuzzle(this.index, this.typeList);
  final int index;
  final TypeListCellsPuzzle typeList;

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
