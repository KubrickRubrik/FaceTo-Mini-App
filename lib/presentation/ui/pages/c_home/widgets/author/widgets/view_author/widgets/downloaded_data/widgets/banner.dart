part of '../downloaded_data.dart';

/// User banner
class _Banner extends StatelessWidget {
  const _Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 65),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFdddddd),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xFFffffff)),
            image: DecorationImage(
              image: NetworkImage(
                ConfigLinks.parseLinks(
                  context.read<AuthorProvider>().pageData.image.banner,
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
