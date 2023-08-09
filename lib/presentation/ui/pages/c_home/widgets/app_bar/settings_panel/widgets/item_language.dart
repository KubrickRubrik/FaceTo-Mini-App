import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/localization/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/providers/session/session.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

class ItemLanguageTheme extends StatefulWidget {
  const ItemLanguageTheme({super.key});

  @override
  State<ItemLanguageTheme> createState() => ItemLanguageThemeState();
}

class ItemLanguageThemeState extends State<ItemLanguageTheme> {
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
                AppIcons.language,
                color: Color(0xFF745291),
                size: 22,
              ),
            ),
          ),
          Expanded(
            child: Text(
              context.lcz.languageSettings,
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
    return Selector<SessionProvider, AvailableAppLocale>(
      selector: (_, Model) => Model.sessionUser.settings.locale,
      builder: (_, locale, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: LocalizationController.defaultLanguage.entries.map((e) {
            return InkWell(
              onTap: () {
                context.read<SessionProvider>().setLocale(e.key);
              },
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    height: 25,
                    width: 50,
                    child: Center(
                      child: Icon(
                        (locale == e.key) ? AppIcons.mark_done : AppIcons.mark_none,
                        color: (locale == e.key) ? Colors.blue : Colors.blueGrey,
                        size: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.value.title,
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
