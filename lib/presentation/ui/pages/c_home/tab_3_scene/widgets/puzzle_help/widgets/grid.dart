part of "../puzzle_help.dart";

class _GridScene extends StatelessWidget {
  const _GridScene({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.gridScene);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: const Text(
          '1:1',
          // "${Provider.of<SceneBloc>(context).xCountItemFace} : ${Provider.of<SceneBloc>(context).yCountItemFace}",
          style: TextStyle(
            color: Color(0xFF00A2FF),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
