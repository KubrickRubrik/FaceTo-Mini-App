import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/winners/winners.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/item_winner/item.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:provider/provider.dart';

class ListWinners extends StatefulWidget {
  const ListWinners({super.key});

  @override
  State<ListWinners> createState() => _ListWinnersState();
}

class _ListWinnersState extends State<ListWinners> {
  final scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            context.read<WinnersProvider>().getScrollData();
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<WinnersProvider, ({int length, StatusContent status})>(
      selector: (_, Model) => (length: 1, status: Model.status.statusLoadWinners),
      builder: (_, model, child) {
        return ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
          itemCount: model.length + 1,
          itemBuilder: (context, index) {
            if (index == model.length) {
              switch (model.status) {
                case StatusContent.isLoadContent:
                  return SizedBox(
                    height: 60,
                    child: Image.asset(AppImages.spinDark),
                  );
                case StatusContent.isEmptyContent:
                  return const SizedBox(height: 60);
                default:
                  const SizedBox();
              }
            }
            return ComponentWinnerItem(context.read<WinnersProvider>().dataPage.winners.listWinners.elementAt(index));
          },
        );
      },
    );
  }
}
