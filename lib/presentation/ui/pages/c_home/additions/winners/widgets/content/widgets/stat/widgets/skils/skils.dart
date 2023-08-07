part of '../../stat.dart';

class _SkilsWinnersStat extends StatelessWidget {
  const _SkilsWinnersStat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //? Label
        _LabelSkils(),
        //? Graph
        AspectRatio(
          aspectRatio: 1.1,
          child: Stack(
            children: [
              //? Y-Coord
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: _YCoordSkils(),
              ),
              //? X-Coord
              Positioned(
                bottom: 70,
                left: 0,
                right: 0,
                child: _XCoordSkils(),
              ),
              //? Graph
              _GraphSkils(),
            ],
          ),
        ),
      ],
    );
  }
}

class AxisCoord extends StatelessWidget {
  AxisCoord({
    super.key,
    required this.size,
    required this.count,
    required this.direction,
  });
  final Axis direction;
  final double size;
  final double count;
  final list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < count; i++) {
      list.add(Flexible(
        child: Center(
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
        ),
      ));
    }
    return Flex(
      direction: direction,
      children: list,
    );
  }
}
