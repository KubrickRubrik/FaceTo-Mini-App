part of '../item.dart';

class _RatingSeries extends StatelessWidget {
  const _RatingSeries(this.index);
  final int index;

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
          color: const Color(0xAA000000),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 40),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: Selector<SeriesProvider, int>(
                selector: (_, Model) => Model.pageData.listSeries.elementAt(index).stat.ratingSeries,
                builder: (_, ratingSeries, __) {
                  return Text(
                    (ratingSeries == 0) ? '-' : ratingSeries.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFF8800),
                    ),
                  );
                },
              ),
            ),
            const _Spacer(),
            Container(
              constraints: const BoxConstraints(minWidth: 40),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.center,
              child: Selector<SeriesProvider, int>(
                selector: (_, Model) => Model.pageData.listSeries.elementAt(index).stat.countUsersRating,
                builder: (_, countUsersRating, __) {
                  return Text(
                    (countUsersRating == 0) ? '-' : countUsersRating.toString(),
                    style: const TextStyle(
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
    );
  }
}
