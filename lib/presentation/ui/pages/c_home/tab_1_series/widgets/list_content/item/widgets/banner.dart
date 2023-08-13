part of '../item.dart';

class _Banner extends StatelessWidget {
  const _Banner(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    final series = context.read<SeriesProvider>().pageData.listSeries.elementAt(index);
    return RotatedBox(
      quarterTurns: (series.image.typeView == 1) ? -1 : 0,
      child: ComponentImage(
        typeSourceImage: series.image.typeSourceImage,
        targetSourceImage: TargetSourceImage.series,
        typeCache: TypeCacheImage.notCache,
        idSeries: series.idSeries,
        idImage: series.image.idImage,
      ),
    );
  }
}
