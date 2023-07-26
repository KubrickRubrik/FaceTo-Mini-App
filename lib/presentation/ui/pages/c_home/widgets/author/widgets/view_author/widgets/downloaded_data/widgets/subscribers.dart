part of '../downloaded_data.dart';

/// Author's followers
class _Subscribers extends StatelessWidget {
  const _Subscribers({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, int>(
        selector: (_, Model) => Model.pageData.stat.countSub,
        builder: (_, countSub, __) {
          if (countSub == 0) return const SizedBox.shrink();
          return Positioned(
            bottom: 70,
            left: 155,
            right: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xAA000000),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      AppIcons.users,
                      color: Color(0xFFFFFFFF),
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      ConfigNumbers.shortValue(
                        countSub,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
