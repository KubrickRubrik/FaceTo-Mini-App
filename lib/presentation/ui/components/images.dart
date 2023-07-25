import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  });
  final TypeSourceImage typeSourceImage; // Server, asset
  final TargetSourceImage targetSourceImage; // User image, series, scene
  final TypeCacheImage? typeCache; // To determine if it was worth caching an image from the Internet
  final String? imagePath; // path (internet)/id(device) image
  final int? idSeries; // path (internet)/id(device) image
  final int? idScene; // path (internet)/id(device) image
  final int? idImage;

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
          fit: BoxFit.cover,
        ),
      _ => (typeCache == TypeCacheImage.cache)
          ? CachedNetworkImage(
              imageUrl: ConfigLinks.parseLinks(imagePath!),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            )
          : Image.network(
              ConfigLinks.parseLinks(imagePath!),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
    };
  }
}
