import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/winners/winners.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

class TabBarWinner extends StatelessWidget {
  const TabBarWinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.5),
            color: Color(0x77000000),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //? Label bar
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<WinnersProvider>().closeWinners();
                },
                child: Container(
                  width: 60,
                  alignment: Alignment.center,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      AppIcons.back,
                      size: 13,
                      color: Color(0xFFffffff),
                    ),
                  ),
                ),
              ),
              //! Title
              Selector<WinnersProvider, bool>(
                selector: (_, Model) => Model.dataPage.isDisplayStat,
                builder: (_, isDisplayStat, __) {
                  return Text(
                    isDisplayStat ? context.lcz.labelWinnerScene : context.lcz.labelWinnerInfoStatistic,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ],
          ),
          //? Button icon
          InkWell(
            onTap: () {
              context.read<WinnersProvider>().setDisplayInfoStat();
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Selector<WinnersProvider, bool>(
                selector: (_, Model) => Model.dataPage.isDisplayStat,
                builder: (_, isDisplayStat, __) {
                  return Icon(
                    isDisplayStat ? AppIcons.close : AppIcons.info,
                    color: const Color(0xFFFF1E00),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
