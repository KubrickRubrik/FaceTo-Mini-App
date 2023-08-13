part of '../item.dart';

class _DescriptionSeries extends StatelessWidget {
  const _DescriptionSeries(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    final series = context.read<SeriesProvider>().pageData.listSeries.elementAt(index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! User
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xAA000000),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              //! Author series
              InkWell(
                onTap: () {
                  context.read<PagesControllerProvider>().setViewInfoAuthorPage();
                  context.read<AuthorProvider>().getAuthor(series.user.author.idApp);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    AppIcons.user,
                    size: 20,
                  ),
                ),
              ),
              const _Spacer(),
              //! Diagonal hard
              InkWell(
                onTap: () {
                  if (series.hardLevel != 1) {
                    ToastMassage.toast(context, context.lcz.hardLevelDifficult);
                  } else {
                    ToastMassage.toast(context, context.lcz.simplyLevelDifficult);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  child: Icon(
                    AppIcons.diagonal,
                    size: 17,
                    color: (series.hardLevel != 1) ? const Color(0xFFFF006A) : const Color(0xFFD8D8D8),
                  ),
                ),
              ),
              const _Spacer(),
              //! ID Series
              InkWell(
                onTap: () {
                  ToastMassage.toast(context, context.lcz.identificatorSeries);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FittedBox(
                    child: Text(
                      context.read<SeriesProvider>().pageData.listSeries.elementAt(index).idSeries.toString(),
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        //! Count users
        InkWell(
          onTap: () {
            ToastMassage.toast(context, context.lcz.usersSeries);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            decoration: BoxDecoration(
              color: const Color(0xAA000000),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(AppIcons.users, size: 25),
                const SizedBox(width: 5),
                Container(
                  constraints: const BoxConstraints(minWidth: 30),
                  alignment: Alignment.center,
                  child: Selector<SeriesProvider, int>(
                    selector: (_, Model) => Model.pageData.listSeries.elementAt(index).stat.countUsers,
                    builder: (_, countUsers, __) {
                      return Text(
                        (countUsers == 0) ? '-' : countUsers.toString(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
