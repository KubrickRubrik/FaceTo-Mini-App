part of '../../controller.dart';

class _OfflineWinnerSection extends StatelessWidget {
  const _OfflineWinnerSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFFCEDED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Flex(
        direction: Axis.horizontal,
        children: [
          //! Stat
          Flexible(
            flex: 6,
            child: StatWinnerPlace(),
          ),
          //! Image places
          Flexible(
            flex: 4,
            child: ImageWinnerPlace(),
          ),
        ],
      ),
    );
  }
}
