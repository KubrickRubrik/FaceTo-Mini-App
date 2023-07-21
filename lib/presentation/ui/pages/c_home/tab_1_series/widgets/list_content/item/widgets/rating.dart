part of '../item.dart';

class _RatingSeries extends StatelessWidget {
  const _RatingSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Provider.of<ControllerBloc>(context, listen: false).setViewInfoByRatingSeries();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 35,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 40),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: const Text(
                '-',
                // [null, 0].contains(Provider.of<CM_SeriesBloc>(context).content.stat.rating)
                //     ? '-'
                //     : "${Provider.of<CM_SeriesBloc>(context).content.stat.rating}",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFF8800),
                ),
              ),
            ),
            const _Spacer(),
            Container(
              constraints: const BoxConstraints(minWidth: 40),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    '-',
                    // (Provider.of<CM_SeriesBloc>(context).content.stat.countUsersRating == 0)
                    //     ? '-'
                    //     : APP_UTILITY.setShortCount(Provider.of<CM_SeriesBloc>(context).content.stat.countUsersRating),
                    style: context.textStyle.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
