import 'dart:io';

import 'package:facetomini/core/config/entity.dart';

abstract final class ConfigLinks {
  static const versionOs = 5.0;
  //! Limits
  static const limitAndroid = 7.1;
  static const limitIos = 10.0;

  // Formation of the default path to images
  static String getAssetPathImage({
    required TargetSourceImage target,
    int? idSeries,
    int? idScene,
    int? idImage,
  }) {
    return switch (target) {
      TargetSourceImage.app => '',
      TargetSourceImage.series => 'asset/series/s_$idSeries/$idImage.webp',
      TargetSourceImage.scenes => 'asset/series/s_$idSeries/$idScene/$idImage.webp',
    };
  }

  // Preparing a link due to problems with the hosting SSL certificate
  static String parseLinks(String link) {
    // print("Было: $link");
    String linkRes = '';
    if (Platform.isAndroid) {
      if (versionOs > limitAndroid) {
        linkRes = link;
      } else {
        linkRes = link.replaceFirst('https', 'http');
      }
    } else if (Platform.isIOS) {
      if (versionOs > limitIos) {
        linkRes = link;
      } else {
        linkRes = link.replaceFirst('https', 'http');
      }
    } else {
      linkRes = link.replaceFirst('https', 'http');
    }
    // print("URL: $linkRes");
    return linkRes;
  }
}
