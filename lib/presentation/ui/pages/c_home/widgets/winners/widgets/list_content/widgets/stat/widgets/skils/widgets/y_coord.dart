part of '../../../stat.dart';

class _YCoordSkils extends StatelessWidget {
  const _YCoordSkils({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 40,
        child: Flex(
          direction: Axis.vertical,
          children: [
            //? Dot Top
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            //? Axis
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: AxisCoord(
                  size: 2,
                  count: 25,
                  direction: Axis.vertical,
                ),
              ),
            ),
            //? Dot Bottom
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: const Color(0xFF00A2FF),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            //? Label Bottom
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 32,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                context.lcz.midDataStatistics,
                style: const TextStyle(
                  color: Color(0xFF0059FF),
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
