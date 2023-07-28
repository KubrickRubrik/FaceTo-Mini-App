part of '../item.dart';

class _Banner extends StatelessWidget {
  const _Banner(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    final scene = context.read<ScenesProvider>().pageData.listScenes.elementAt(index);
    return Flexible(
      flex: 4,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: AspectRatio(
          aspectRatio: 0.8,
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
                //! Image
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      // int sizeScreen = APP_STYLE.setSizeElem(2, 1, context).toInt();
                      // _FMD_CONTROLLER.setContentTab_3_TAP(Provider.of<CM_SceneBloc>(context, listen: false).item, sizeScreen);
                      context.read<PagesControllerProvider>().swipeToScene();
                    },
                    enableFeedback: false,
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
                ),
                //! Curtain if the stage is not open
                Selector<ScenesProvider, int>(
                  selector: (_, Model) => Model.pageData.listScenes.elementAt(index).user.stat.completed,
                  builder: (_, completed, __) {
                    if (completed == 1) return const SizedBox.shrink();
                    return Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _NotCompletedScene(index),
                    );
                  },
                ),
                //! Item
                const Positioned(
                  bottom: 10,
                  left: 10,
                  right: null,
                  child: _SceneNumber(),
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
    final scene = context.read<ScenesProvider>().pageData.listScenes.elementAt(index);
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        child: InkWell(
          onTap: () {
            switch (scene.typeTree) {
              // Open tree
              case 1:
                // _FMD_CONTROLLER.setContentTab_3_TAP(Provider.of<CM_SceneBloc>(context, listen: false).item, sizeScreen);
                break;
              // Close tree
              case 2:
                // If the previous item is open, open the ability to run this item
                if (context.read<ScenesProvider>().isCompletedPreviousScene(index)) {
                  //   _FMD_CONTROLLER.setContentTab_3_TAP(Provider.of<CM_SceneBloc>(context, listen: false).item, sizeScreen);
                } else {
                  ToastMassage.toast(context, context.lcz.lockScene, code: TypeMassage.warning);
                }
                break;
            }
          },
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
                    //! Blot
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
                    //! Button
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
  const _SceneNumber();

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
      child: const Text(
        "1",
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
