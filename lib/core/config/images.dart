import 'package:facetomini/core/config/entity.dart';

class ConfigImages {
  // Formation of the default path to images
  String getAssetFileImage({
    required TargetImageSource target,
    int? idSeries,
    int? idScene,
    int? idImage,
  }) {
    return switch (target) {
      TargetImageSource.app => '',
      TargetImageSource.series => 'asset/series/s_$idSeries/$idImage.webp',
      TargetImageSource.scenes => 'asset/series/s_$idSeries/$idScene/$idImage.webp',
    };
  }
}
