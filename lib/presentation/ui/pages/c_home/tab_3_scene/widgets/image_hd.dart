import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageAdditionPage extends StatelessWidget {
  const ImageAdditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scene = context.read<SceneProvider>().pageData;
    return const Center(
      child: ComponentImage(
        typeSourceImage: TypeSourceImage.asset,
        targetSourceImage: TargetSourceImage.scenes,
        typeCache: TypeCacheImage.notCache,
        idSeries: 1,
        idImage: 1,
      ),
      // CM_ViewImage(
      //   TypeCacheImage.notCache,
      //   TypeImageTarget.scenes,
      //   Provider.of<SceneBloc>(context).content.imageScene.typeOriginImage,
      //   Provider.of<SceneBloc>(context).content.idSeries,
      //   Provider.of<SceneBloc>(context).content.idScene,
      //   Provider.of<SceneBloc>(context).content.imageScene.urlMiddle,
      //   Provider.of<SceneBloc>(context).aScale,
      //   Alignment.topLeft,
      //   BoxFit.none,
      // ),
    );
  }
}
