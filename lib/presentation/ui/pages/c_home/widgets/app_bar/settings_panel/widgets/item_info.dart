import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';

class ItemInfoTheme extends StatefulWidget {
  const ItemInfoTheme({super.key});

  @override
  State<ItemInfoTheme> createState() => ItemInfoThemeState();
}

class ItemInfoThemeState extends State<ItemInfoTheme> {
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
                AppIcons.info,
                color: Color(0xFF745291),
                size: 22,
              ),
            ),
          ),
          Expanded(
            child: Text(
              context.lcz.infoSettings,
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
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) {
          return Container(
            height: 40,
            color: (index % 2 == 0) ? Colors.grey.shade500 : Colors.grey.shade200,
          );
        }),
      ),
    );
  }
}
