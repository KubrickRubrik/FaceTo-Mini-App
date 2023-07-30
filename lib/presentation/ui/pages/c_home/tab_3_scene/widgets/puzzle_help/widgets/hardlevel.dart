part of '../puzzle_help.dart';

class _HardLevel extends StatelessWidget {
  const _HardLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.read<SceneProvider>().pageData.puzzle.scene.hardLevel == 1) {
          ToastMassage.toast(context, context.lcz.higtHardLevel);
        } else {
          ToastMassage.toast(context, context.lcz.lowHardLevel);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        height: 50,
        child: Selector<SceneProvider, int>(
          selector: (_, Model) => Model.pageData.puzzle.scene.hardLevel,
          builder: (_, hardLevel, __) {
            return Icon(
              AppIcons.diagonal,
              size: 30,
              color: (hardLevel != 1) ? const Color(0xFFFF006A) : const Color(0xFFD8D8D8),
            );
          },
        ),
      ),
    );
  }
}
