part of '../item.dart';

class _Banner extends StatelessWidget {
  const _Banner(this.item, {super.key});
  final SceneEntity item;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: (item.image.typeView == 1) ? -1 : 0,
      child: ComponentImage(
        typeSourceImage: item.image.typeSourceImage,
        targetSourceImage: TargetSourceImage.scenes,
        typeCache: TypeCacheImage.notCache,
        idSeries: item.idSeries,
        idImage: item.image.idImage,
      ),
    );
  }
}
