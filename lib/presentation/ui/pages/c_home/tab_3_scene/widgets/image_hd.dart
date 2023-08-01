import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:provider/provider.dart';

class ImageSceneAdditionPage extends StatelessWidget {
  const ImageSceneAdditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<SceneProvider, (StatusContent, int)>(
        selector: (_, Model) => (
          Model.statusAdditionPages.displayImageHD,
          Model.pageData.puzzle.scene.imageScene.idImage,
        ),
        builder: (_, model, __) {
          if (model.$1 != StatusContent.isViewContent) return const SizedBox.shrink();
          final puzzle = context.read<SceneProvider>().pageData.puzzle;
          return ComponentImage(
            typeSourceImage: puzzle.scene.imageScene.typeSourceImage,
            targetSourceImage: TargetSourceImage.scenes,
            typeCache: TypeCacheImage.notCache,
            imagePath: puzzle.scene.imageScene.url,
            idSeries: puzzle.scene.useIdSeries,
            idScene: puzzle.scene.useIdScene,
            idImage: puzzle.scene.imageScene.idImage,
            scale: puzzle.playArea.aScale,
            alignment: Alignment.topLeft,
            fit: BoxFit.none,
          );
        },
      ),
    );
  }
}
