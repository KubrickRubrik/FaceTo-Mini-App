import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/links.dart';

class ComponentImage extends StatelessWidget {
  const ComponentImage({
    super.key,
    required this.typeSourceImage,
    required this.targetSourceImage,
    required this.typeCache,
    this.imagePath,
    this.idSeries,
    this.idScene,
    this.idImage,
    this.scale = 1,
    this.alignment = Alignment.center,
    this.fit = BoxFit.cover,
  });
  final TypeSourceImage typeSourceImage; // Server, asset
  final TargetSourceImage targetSourceImage; // User image, series, scene
  final TypeCacheImage? typeCache; // To determine if it was worth caching an image from the Internet
  final String? imagePath; // path (internet)/id(device) image
  final int? idSeries; // path (internet)/id(device) image
  final int? idScene; // path (internet)/id(device) image
  final int? idImage;
  final double scale;
  final AlignmentGeometry alignment;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return switch (typeSourceImage) {
      TypeSourceImage.asset => Image.asset(
          ConfigLinks.getAssetPathImage(
            target: targetSourceImage,
            idSeries: idSeries,
            idScene: idScene,
            idImage: idImage,
          ),
          scale: scale,
          alignment: alignment,
          fit: fit,
        ),
      _ => Image.network(
          ConfigLinks.parseLinks(imagePath!),
          scale: scale,
          alignment: alignment,
          fit: fit,
        ),
    };
  }
}
