part of '../item.dart';

class LineScene extends StatelessWidget {
  const LineScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 3,
          child: Container(),
        ),
        Flexible(
          flex: 4,
          child: Center(
            child: Container(
              width: 5,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
