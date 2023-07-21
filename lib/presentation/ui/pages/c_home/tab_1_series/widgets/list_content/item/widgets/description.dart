part of '../item.dart';

class _DescriptionSeries extends StatelessWidget {
  const _DescriptionSeries({super.key});

  @override
  Widget build(BuildContext context) {
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
                  // Provider.of<CM_AuthorBloc>(context, listen: false).getData(Provider.of<CM_SeriesBloc>(context, listen: false).content.userAuthor.idApp);
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
                  // if (Provider.of<CM_SeriesBloc>(context, listen: false).content.diagonal != 1) {
                  //   APP_UTILITY.viewToast(101, APP_STRING.helpHardLevelScene);
                  // } else {
                  //   APP_UTILITY.viewToast(101, APP_STRING.helpEasyLevelScene);
                  // }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  child: const Icon(
                    AppIcons.diagonal,
                    size: 17,
                    // color: (Provider.of<CM_SeriesBloc>(context).content.diagonal != 1) ? const Color(0xFFFF006A) : const Color(0xFFD8D8D8),
                  ),
                ),
              ),
              const _Spacer(),
              //! ID Series
              InkWell(
                onTap: () {
                  // APP_UTILITY.viewToast(101, APP_STRING.toastIdSeries);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(''
                      // "${Provider.of<CM_SeriesBloc>(context).content.idSeries}",
                      // style: APP_STYLE.setFontStyle(14.0, null, 1.3, 0xFFffffff, FontWeight.w400, context),
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
            // APP_UTILITY.viewToast(101, APP_STRING.toastCountUsersSeries);
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
                  child: Text(
                    '',
                    // (Provider.of<CM_SeriesBloc>(context).content.stat.countUsers == 0)
                    //     ? '-'
                    //     : APP_UTILITY.setShortCount(Provider.of<CM_SeriesBloc>(context).content.stat.countUsers),
                    style: context.textStyle.bodyMedium,
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
