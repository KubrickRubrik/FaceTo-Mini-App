part of '../puzzle_help.dart';

class _ButtonHelp extends StatelessWidget {
  const _ButtonHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // _FMD_SCENE.heplDetails();
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
