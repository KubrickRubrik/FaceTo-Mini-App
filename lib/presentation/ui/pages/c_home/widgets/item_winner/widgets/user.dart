part of '../item.dart';

class _UserData extends StatelessWidget {
  const _UserData(this.data);
  final ChampionData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Provider.of<CM_AuthorBloc>(context, listen: false).getData(_data.idApp);
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
                child: const ComponentImage(
                  typeSourceImage: TypeSourceImage.server, // _data.image.typeOriginLogo,
                  targetSourceImage: TargetSourceImage.app,
                  typeCache: TypeCacheImage.notCache,
                  imagePath: '',
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
                  fontWeight: FontWeight.w400,
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
