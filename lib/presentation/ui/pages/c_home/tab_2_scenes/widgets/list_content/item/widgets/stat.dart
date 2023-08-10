part of '../item.dart';

class _Stat extends StatelessWidget {
  const _Stat(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          //! Time
          InkWell(
            onTap: () {
              context.read<WinnersProvider>().getWinners(
                    context.read<ScenesProvider>().pageData.listScenes.elementAt(index).idScene,
                    TypeWinnersSource.scenes,
                  );
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: ThemesController.getThemeData<Color>(
                  component: TypeThemeComponent.scenesStatBackground,
                  val: context.read<SessionProvider>().sessionUser.settings.theme,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: -2,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(
                AppIcons.timer,
                color: ThemesController.getThemeData<Color>(
                  component: TypeThemeComponent.scenesStatContent,
                  val: context.read<SessionProvider>().sessionUser.settings.theme,
                ),
                size: 25,
              ),
            ),
          ),
          SizedBox(height: 15, child: Center(child: dotSpaces(context))),
          //! Users
          InkWell(
            onTap: () {
              ToastMassage.toast(context, context.lcz.usersScene);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints(minWidth: 50),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFeeeeee),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 50),
                        Selector<ScenesProvider, int>(
                          selector: (_, Model) => Model.pageData.listScenes.elementAt(index).stat.countUsers,
                          builder: (_, countUsers, __) {
                            return switch (countUsers) {
                              > 0 => Container(
                                  padding: const EdgeInsets.only(left: 10, right: 15),
                                  child: Text(
                                    ConfigNumbers.shortValue(countUsers),
                                    style: const TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              _ => const SizedBox.shrink(),
                            };
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF442700),
                            offset: Offset(0, 2),
                            blurRadius: 3,
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        AppIcons.users,
                        color: Color(0xFF505050),
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15, child: Center(child: dotSpaces(context))),
          //! Author
          InkWell(
            onTap: () {
              final scene = context.read<ScenesProvider>().pageData.listScenes.elementAt(index);
              context.read<PagesControllerProvider>().setViewInfoAuthorPage();
              context.read<AuthorProvider>().getAuthor(scene.user.author.idApp);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: ThemesController.getThemeData<Color>(
                  component: TypeThemeComponent.scenesStatBackground,
                  val: context.read<SessionProvider>().sessionUser.settings.theme,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF442700),
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: -2,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Icon(
                AppIcons.user,
                color: ThemesController.getThemeData<Color>(
                  component: TypeThemeComponent.scenesStatContent,
                  val: context.read<SessionProvider>().sessionUser.settings.theme,
                ),
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dotSpaces(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ThemesController.getThemeData<Color>(
          component: TypeThemeComponent.scenesStatBackground,
          val: context.read<SessionProvider>().sessionUser.settings.theme,
        ),
      ),
    );
  }
}
