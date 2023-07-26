part of '../downloaded_data.dart';

/// Author contact list
class _ListLinks extends StatelessWidget {
  const _ListLinks();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      alignment: Alignment.center,
      child: Selector<AuthorProvider, (int, int)>(
        selector: (_, Model) => (Model.pageData.idApp, Model.pageData.links.length),
        builder: (_, model, __) {
          final listLinks = Provider.of<AuthorProvider>(context).pageData.links;
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 7,
            runSpacing: 7,
            children: listLinks.map((link) {
              return InkWell(
                onTap: () {
                  Provider.of<AuthorProvider>(context, listen: false).setViewLinks(link);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    border: Border.all(width: 1.5, color: const Color(0xFFffffff)),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: ConfigLinks.parseLinks(link.icon.url),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
