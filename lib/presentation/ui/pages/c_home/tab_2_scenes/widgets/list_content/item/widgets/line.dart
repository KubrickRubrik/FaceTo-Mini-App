part of '../item.dart';

class LineScene extends StatelessWidget {
  const LineScene({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        const Spacer(flex: 3),
        Flexible(
          flex: 4,
          child: Center(
            child: Container(
              width: 5,
              color: ThemesController.getThemeData<Color>(
                component: TypeThemeComponent.scenesBanner,
                val: context.read<SessionProvider>().sessionUser.settings.theme,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
