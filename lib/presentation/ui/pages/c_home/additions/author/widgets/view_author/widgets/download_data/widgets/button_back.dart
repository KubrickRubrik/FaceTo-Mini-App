part of '../download_data.dart';

/// Button back
class _ButtonBack extends StatelessWidget {
  const _ButtonBack();
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
