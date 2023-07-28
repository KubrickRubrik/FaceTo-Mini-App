part of '../downloaded_data.dart';

/// Layout: user rank
class _Rank extends StatelessWidget {
  const _Rank();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //? Nick
          Selector<AuthorProvider, String>(
            selector: (_, Model) => Model.pageData.author.nick,
            builder: (_, nick, __) {
              return Container(
                height: 35,
                alignment: Alignment.centerLeft,
                child: Text(
                  nick,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle.bodyLarge,
                ),
              );
            },
          ),
          //? Rank & Nick
          Selector<AuthorProvider, int>(
            selector: (_, Model) => Model.pageData.author.stat.rank.id,
            builder: (_, idRank, __) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFF4114E0),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: Text(
                  LocalizationController.getRankUserDescription(context, idRank),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
