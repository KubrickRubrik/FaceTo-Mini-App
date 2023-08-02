part of '../item.dart';

class _Banner extends StatelessWidget {
  const _Banner(this.index);
  final int index;

  void runGame(BuildContext context, SceneEntity scene) {
    print("Tap");
    final size = MediaQuery.of(context).size;
    context.read<SceneProvider>().runPuzzleGame(scene: scene, size: size).then((isDone) {
      if (isDone == null) return;
      if (!isDone) {
        // If the scene didn't load
        ToastMassage.toast(context, context.lcz.sceneNotAvailable, code: TypeMassage.error);
        return;
      }
      context.read<PagesControllerProvider>().swipeToScene();
    });
  }

  @override
  Widget build(BuildContext context) {
    final scene = context.read<ScenesProvider>().pageData.listScenes.elementAt(index);
    return Align(
      alignment: Alignment.bottomLeft,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: InkWell(
          onTap: () {
            if (scene.user.stat.completed == 1) {
              runGame(context, scene);
            } else {
              switch (scene.typeTree) {
                case 1:
                  // Open tree
                  runGame(context, scene);
                  break;
                case 2:
                  // Close tree
                  // If the previous item is open, open the ability to run this item
                  if (context.read<ScenesProvider>().isCompletedPreviousScene(index)) {
                    runGame(context, scene);
                  } else {
                    ToastMassage.toast(context, context.lcz.lockScene, code: TypeMassage.warning);
                  }
                  break;
              }
            }
          },
          enableFeedback: false,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF442700),
                  offset: Offset(0, 6),
                  blurRadius: 10,
                  spreadRadius: -8,
                ),
              ],
            ),
            child: Stack(
              children: [
                //? Image
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFeeeeee),
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: RotatedBox(
                      quarterTurns: (scene.image.typeView == 1) ? -1 : 0,
                      child: ComponentImage(
                        typeSourceImage: scene.image.typeSourceImage,
                        targetSourceImage: TargetSourceImage.scenes,
                        typeCache: TypeCacheImage.notCache,
                        idSeries: scene.idSeries,
                        idScene: scene.idScene,
                        idImage: scene.image.idImage,
                      ),
                    ),
                  ),
                ),
                //? Curtain if the stage is not open
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _NotCompletedScene(index),
                ),

                //? Item
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: null,
                  child: _SceneNumber(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Curtain if the stage is not open
class _NotCompletedScene extends StatelessWidget {
  const _NotCompletedScene(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Selector<ScenesProvider, int>(
      selector: (_, Model) => Model.pageData.listScenes.elementAt(index).user.stat.completed,
      builder: (_, completed, child) {
        if (completed == 1) return const SizedBox.shrink();
        return child!;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 200,
                ),
                child: Stack(
                  children: [
                    //? Blot
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Builder(builder: (context) {
                          return RotatedBox(
                            quarterTurns: Random().nextInt(4),
                            child: Image.asset(
                              AppImages.blot,
                              color: Color(
                                AppColors.colorsBlot[Random().nextInt(AppColors.colorsBlot.length)],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    //? Button
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(40),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFffffff),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Selector<ScenesProvider, bool>(
                            selector: (_, Model) => Model.isCompletedPreviousScene(index),
                            builder: (_, completed, __) {
                              var icon = AppIcons.click;
                              // If the previous item is close, close the ability to run this item
                              if (context.read<ScenesProvider>().pageData.listScenes.elementAt(index).typeTree == 2 && !completed) {
                                icon = AppIcons.lock;
                              }
                              return Icon(
                                icon,
                                size: 25,
                                color: Colors.black,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Scene number in series
class _SceneNumber extends StatelessWidget {
  const _SceneNumber(this.index);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(0.0, 0.0),
          ),
          BoxShadow(
            color: Color(0xFFffffff),
            offset: Offset(0, 1.5),
            spreadRadius: 0.2,
            blurRadius: 0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        "${index + 1}",
        style: const TextStyle(
          fontSize: 14,
          height: 1.6,
        ),
      ),
    );
  }
}
