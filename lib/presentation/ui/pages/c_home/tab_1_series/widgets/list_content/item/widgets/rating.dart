part of '../item.dart';

class _RatingSeries extends StatelessWidget {
  const _RatingSeries(this.item);
  final SeriesEntity item;

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
              child: Text(
                (item.stat.ratingSeries == 0) ? '-' : item.stat.ratingSeries.toString(),
                style: const TextStyle(
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
                    (item.stat.countUsersRating == 0) ? '-' : item.stat.countUsersRating.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
