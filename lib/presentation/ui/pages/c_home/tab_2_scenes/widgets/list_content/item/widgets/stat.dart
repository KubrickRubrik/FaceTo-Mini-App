part of '../item.dart';

class _Stat extends StatelessWidget {
  const _Stat(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        // color: Colors.blue,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            //! Time
            InkWell(
              onTap: () {
                //! context.read<ScenesProvider>().pageData.listScenes[index].idScene
                // Provider.of<CM_WinnersBloc>(context, listen: false).viewWinners('scene', Provider.of<CM_SceneBloc>(context, listen: false).content.idScene);
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF313131),
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
                child: const Icon(
                  AppIcons.timer,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),

            Container(
              height: 15,
              alignment: Alignment.center,
              child: dotSpaces(),
            ),
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
            Container(
              height: 15,
              alignment: Alignment.center,
              child: dotSpaces(),
            ),
            //! Author
            InkWell(
              onTap: () {
                //! context.read<ScenesProvider>().pageData.listScenes[index].user.author.idApp
                // Provider.of<CM_AuthorBloc>(context, listen: false).getData(
                //   Provider.of<CM_SceneBloc>(context, listen: false).content.userAuthor.idApp,
                // );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF313131F),
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
                child: const Icon(
                  AppIcons.user,
                  color: Color(0xFFFFFFFF),
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dotSpaces() {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
    );
  }
}
