part of '../download_data.dart';

/// Layout: author contact list
class _ListLinks extends StatelessWidget {
  const _ListLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      alignment: Alignment.center,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFDBDADA),
          border: Border.all(width: 1.5, color: const Color(0xFFffffff)),
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
