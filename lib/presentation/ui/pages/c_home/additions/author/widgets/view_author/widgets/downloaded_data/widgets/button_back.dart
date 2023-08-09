part of '../downloaded_data.dart';

/// Button back
class _Back extends StatelessWidget {
  const _Back();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PagesControllerProvider>().setViewInfoAuthorPage();
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color(0xAA000000),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: const Icon(AppIcons.back),
      ),
    );
  }
}
