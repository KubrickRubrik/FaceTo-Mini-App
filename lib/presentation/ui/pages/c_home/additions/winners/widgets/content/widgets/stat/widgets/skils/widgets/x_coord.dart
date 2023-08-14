part of '../../../stat.dart';

class _XCoordSkils extends StatelessWidget {
  const _XCoordSkils();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            //? Label Left
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 32,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(math.pi),
                  child: const Icon(
                    AppIcons.like,
                    size: 20,
                    color: Color(0xFFFF0000),
                  ),
                ),
              ),
            ),
            //? Dot Left
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: const Color(0xFFFF0000),
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            //? Axis
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    AxisCoord(
                      size: 2,
                      count: 20,
                      direction: Axis.horizontal,
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          height: 2,
                          width: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFA600),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          height: 10,
                          width: 2,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFA600),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //? Dot Right
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: const Color(0xFF73FF00),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            //? Label Right
            Container(
              margin: const EdgeInsets.only(left: 8),
              height: 32,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                AppIcons.like,
                color: Color(0xFF348100),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
