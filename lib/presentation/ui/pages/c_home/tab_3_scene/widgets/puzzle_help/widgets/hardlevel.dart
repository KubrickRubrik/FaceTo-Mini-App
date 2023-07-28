part of '../puzzle_help.dart';

class _HardLevel extends StatelessWidget {
  const _HardLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // if (Provider.of<SceneBloc>(context, listen: false).diagonal != 1) {
        //   APP_UTILITY.viewToast(101, APP_STRING.helpHardLevelScene);
        // ToastMassage.toast(context, context.lcz.higtHardLevel);
        // } else {
        // ToastMassage.toast(context, context.lcz.lowHardLevel);
        //   APP_UTILITY.viewToast(101, APP_STRING.helpEasyLevelScene);
        // }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        height: 50,
        child: const Icon(
          AppIcons.diagonal,
          size: 30,
          // color: (Provider.of<SceneBloc>(context).diagonal != 1) ? Color(0xFFFF006A) : Color(0xFFD8D8D8),
        ),
      ),
    );
  }
}
