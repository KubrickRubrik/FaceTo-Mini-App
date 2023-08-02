part of '../item.dart';

class _CountScenes extends StatelessWidget {
  const _CountScenes(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    final series = context.read<SeriesProvider>().pageData.listSeries.elementAt(index);
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
          child: Text(series.stat.countScenes.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ),
      ),
    );
  }
}
