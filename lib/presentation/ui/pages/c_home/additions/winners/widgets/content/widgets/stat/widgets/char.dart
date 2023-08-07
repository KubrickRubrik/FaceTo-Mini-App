part of '../stat.dart';

class _PublicChar extends StatelessWidget {
  const _PublicChar({super.key});

  String getTitle(BuildContext context) {
    return switch (context.read<WinnersProvider>().dataPage.winners.stat.publicState) {
      1 => context.lcz.playerChar_1,
      2 => context.lcz.playerChar_2,
      3 => context.lcz.playerChar_3,
      _ => context.lcz.playerChar_4,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<WinnersProvider>().dataPage.winners.stat.publicState == 0) return const SizedBox();
    return Column(
      children: [
        //? Label
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 50,
          alignment: Alignment.center,
          child: Text(
            context.lcz.playersCharacteristics,
            style: const TextStyle(
              color: Color(0xFFffffff),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        //?
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            getTitle(context),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
