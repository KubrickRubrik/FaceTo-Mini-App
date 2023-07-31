part of '../puzzle_help.dart';

class _ButtonHelp extends StatelessWidget {
  const _ButtonHelp();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SceneProvider>().displayHelper();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 50,
        child: const Icon(
          AppIcons.help,
          size: 40,
          color: Color(0xFFFFAF02),
        ),
      ),
    );
  }
}
