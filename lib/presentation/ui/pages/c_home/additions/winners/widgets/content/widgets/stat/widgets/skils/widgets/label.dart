part of '../../../stat.dart';

class _LabelSkils extends StatelessWidget {
  const _LabelSkils({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.topCenter,
      child: Text(
        context.lcz.labelGraph_1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
