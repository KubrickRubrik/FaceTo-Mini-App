import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:flutter/material.dart';

class ButtonsWinnerPage extends StatelessWidget {
  const ButtonsWinnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          //! View image
          Flexible(
            flex: 5,
            child: InkWell(
              onTap: () {
                // Provider.of<SceneBloc>(context, listen: false).viewImage();
              },
              child: Container(
                // color: Colors.green,
                alignment: Alignment.center,
                child: const Icon(
                  AppIcons.view,
                  color: Color(0xFF384869),
                  size: 25,
                ),
              ),
            ),
          ),
          const _Separator(),
          //? Reload
          Flexible(
            flex: 4,
            child: InkWell(
              onTap: () {
                // Provider.of<SceneBloc>(context, listen: false).reloadMix();
              },
              child: const Center(
                child: Icon(
                  AppIcons.update,
                  color: Color(0xFF384869),
                  size: 25,
                ),
              ),
            ),
          ),
          const _Separator(),
          //? Next
          Flexible(
            flex: 5,
            child: InkWell(
              onTap: () {
                // Provider.of<SceneBloc>(context, listen: false).nextMix();
              },
              child: const Center(
                child: Icon(
                  AppIcons.next,
                  color: Color(0xFF384869),
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      width: 1,
      color: const Color(0xFFADADAD),
    );
  }
}
