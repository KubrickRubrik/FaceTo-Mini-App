part of '../item.dart';

class _UserData extends StatelessWidget {
  const _UserData(this.data);
  final ChampionData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PagesControllerProvider>().setViewInfoAuthorPage();
        context.read<AuthorProvider>().getAuthor(data.idApp);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 60,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color(0xFFeeeeee),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF585858),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: ComponentImage(
                  typeSourceImage: data.image.typeOriginLogo,
                  targetSourceImage: TargetSourceImage.app,
                  typeCache: TypeCacheImage.notCache,
                  imagePath: data.image.logo,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                data.nick,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
