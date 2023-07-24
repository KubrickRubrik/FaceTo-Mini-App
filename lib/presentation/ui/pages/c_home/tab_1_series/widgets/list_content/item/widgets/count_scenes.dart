part of '../item.dart';

class _CountScenes extends StatelessWidget {
  const _CountScenes({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // APP_UTILITY.viewToast(101, APP_STRING.toastCountScenesSeries);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xAA000000),
          border: Border.all(
            color: const Color(0xAA000000),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          '',
          // "${Provider.of<CM_SeriesBloc>(context).content.stat.countScenes}",
          style: context.textStyle.bodyMedium,
        ),
      ),
    );
  }
}
