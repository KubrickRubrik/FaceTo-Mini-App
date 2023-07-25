part of '../item.dart';

class _CountScenes extends StatelessWidget {
  const _CountScenes(this.countScenes);
  final int countScenes;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.countScenes);
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
        child: FittedBox(
          child: Text(countScenes.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ),
      ),
    );
  }
}
