import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:facetomini/core/config/entity.dart';

abstract final class ConfigLinks {
  static const versionOs = 5.0;
  //! Limits
  static const limitAndroid = 7.1;
  static const limitIos = 10.0;
  //! Links
  static const links = LinksData();

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
    String linkRes = link;
    if (!kIsWeb) {
      if (Platform.isAndroid && versionOs <= limitAndroid) {
        linkRes = linkRes.replaceFirst('https', 'http');
      } else if (Platform.isIOS && versionOs <= limitIos) {
        linkRes = link.replaceFirst('https', 'http');
      }
    } else {
      linkRes = link.replaceFirst('https', 'http');
    }
    return linkRes;
  }
}

final class LinksData {
  const LinksData();
  final String linkFaceTo = "https://play.google.com/store/apps/details?id=com.faceto.app.faceto&hl=ru";
}
