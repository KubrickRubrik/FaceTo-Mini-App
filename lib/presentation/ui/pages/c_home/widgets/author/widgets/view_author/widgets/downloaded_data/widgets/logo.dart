part of '../downloaded_data.dart';

/// User avatars
class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFdddddd),
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: NetworkImage(
            ConfigLinks.parseLinks(
              context.read<AuthorProvider>().pageData.image.logo,
            ),
          ),
          fit: BoxFit.cover,
        ),
        border: Border.all(width: 1.5, color: const Color(0xFFffffff)),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 3,
            spreadRadius: -1,
          ),
        ],
      ),
    );
  }
}
