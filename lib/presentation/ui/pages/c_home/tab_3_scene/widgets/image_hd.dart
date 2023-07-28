import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageSceneAdditionPage extends StatelessWidget {
  const ImageSceneAdditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scene = context.read<SceneProvider>().pageData;
    return const Center(
      child: ComponentImage(
        typeSourceImage: TypeSourceImage.asset,
        targetSourceImage: TargetSourceImage.scenes,
        typeCache: TypeCacheImage.notCache,
        imagePath: '',
        idSeries: 1,
        idScene: 1,
        scale: 1, // <-
        alignment: Alignment.topLeft,
        fit: BoxFit.none,
      ),
    );
  }
}
