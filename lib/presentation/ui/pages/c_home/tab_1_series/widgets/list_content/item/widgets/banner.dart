part of '../item.dart';

class _Banner extends StatelessWidget {
  const _Banner(this.item);
  final SeriesEntity item;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: (item.image.typeView == 1) ? -1 : 0,
      child: ComponentImage(
        typeSourceImage: item.image.typeSourceImage,
        targetSourceImage: TargetSourceImage.series,
        typeCache: TypeCacheImage.notCache,
        idSeries: item.idSeries,
        idImage: item.image.idImage,
      ),
    );
  }
}
