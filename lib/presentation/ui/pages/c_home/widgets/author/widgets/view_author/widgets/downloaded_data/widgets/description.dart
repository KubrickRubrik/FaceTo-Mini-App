part of '../downloaded_data.dart';

/// Author's description
class _Description extends StatelessWidget {
  const _Description();
  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, String>(
        selector: (_, Model) => Model.pageData.about,
        builder: (_, about, __) {
          if (about.isEmpty) return const SizedBox.shrink();
          return Container(
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.topLeft,
            child: Text(
              about,
              style: context.textStyle.bodySmall,
            ),
          );
        });
  }
}
