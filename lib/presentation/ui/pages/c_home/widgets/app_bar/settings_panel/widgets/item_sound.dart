import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/session/session.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

class ItemSoundTheme extends StatefulWidget {
  const ItemSoundTheme({super.key});

  @override
  State<ItemSoundTheme> createState() => ItemSoundThemeState();
}

class ItemSoundThemeState extends State<ItemSoundTheme> {
  var isOpen = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (panelIndex, isExpanded) {
        isOpen = !isOpen;
        setState(() {});
      },
      children: [
        ExpansionPanel(
          isExpanded: isOpen,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return const _ItemHeader();
          },
          body: const _ItemBody(),
        ),
      ],
    );
  }
}

//! Header
class _ItemHeader extends StatelessWidget {
  const _ItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              child: const Icon(
                AppIcons.sound,
                color: Color(0xFF745291),
                size: 22,
              ),
            ),
          ),
          Expanded(
            child: Text(
              context.lcz.soundSettings,
              style: context.textStyle.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

//! Body
class _ItemBody extends StatelessWidget {
  const _ItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    final entr = <bool, String>{
      true: context.lcz.soundSettingsOn,
      false: context.lcz.soundSettingsOff,
    };
    return Selector<SessionProvider, bool>(
      selector: (_, Model) => Model.sessionUser.settings.enabledSound,
      builder: (_, enabledSound, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: entr.entries.map((e) {
            return InkWell(
              onTap: () {
                context.read<SessionProvider>().setSound(e.key);
              },
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    height: 25,
                    width: 50,
                    child: Center(
                      child: Icon(
                        (enabledSound == e.key) ? AppIcons.mark_done : AppIcons.mark_none,
                        color: (enabledSound == e.key) ? Colors.blue : Colors.blueGrey,
                        size: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.value,
                        style: context.textStyle.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
