import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

class ItemSettingsTheme extends StatefulWidget {
  const ItemSettingsTheme({super.key});

  @override
  State<ItemSettingsTheme> createState() => ItemSettingsThemeState();
}

class ItemSettingsThemeState extends State<ItemSettingsTheme> {
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
  const _ItemHeader();

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
                AppIcons.favorite,
                color: Color(0xFF745291),
                size: 22,
              ),
            ),
          ),
          Expanded(
            child: Text(
              context.lcz.themeSettings,
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
  const _ItemBody();

  @override
  Widget build(BuildContext context) {
    return Selector<SessionProvider, CurrentThemeApp>(
      selector: (_, Model) => Model.sessionUser.settings.theme,
      builder: (_, theme, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemesController.defaultThemes(context).entries.map((e) {
            return InkWell(
              onTap: () {
                context.read<SessionProvider>().setTheme(e.key);
              },
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    height: 25,
                    width: 50,
                    child: Center(
                      child: Icon(
                        (theme == e.key) ? AppIcons.mark_done : AppIcons.mark_none,
                        color: (theme == e.key) ? Colors.blue : Colors.blueGrey,
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
