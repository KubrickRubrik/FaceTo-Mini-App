part of '../view_author.dart';

class _SpinAuthor extends StatelessWidget {
  const _SpinAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, StatusContent>(
      selector: (_, Model) => Model.statusPage,
      builder: (_, statePage, __) {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          sizeCurve: Curves.ease,
          crossFadeState: (statePage != StatusContent.isLoadContent) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: const SizedBox(height: 10),
          secondChild: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              child: Center(
                child: Image.asset(
                  AppImages.spinLight,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
