part of '../item.dart';

class _Banner extends StatelessWidget {
  const _Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // child: RotatedBox(
    //   quarterTurns: (Provider.of<CM_SeriesBloc>(context).content.imageSeries.typeView == 1) ? -1 : 0,
    //   child: CM_ViewImage(
    //     TypeCacheImage.notCache,
    //     TypeImageTarget.series,
    //     Provider.of<CM_SeriesBloc>(context).content.imageSeries.typeOriginImage,
    //     Provider.of<CM_SeriesBloc>(context).content.idSeries,
    //     null,
    //     Provider.of<CM_SeriesBloc>(context).content.imageSeries.url,
    //     1,
    //     Alignment.center,
    //     BoxFit.cover,
    //   ),
    // );
  }
}
