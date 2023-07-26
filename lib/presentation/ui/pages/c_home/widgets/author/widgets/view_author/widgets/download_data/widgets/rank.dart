part of '../download_data.dart';

/// Layout: user rank
class _Rank extends StatelessWidget {
  const _Rank();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Nick
          Container(
            height: 35,
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(3),
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFdddddd),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          //! Author
          Container(
            margin: const EdgeInsets.only(left: 3),
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFdddddd),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
