import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/winners/winners.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/item_winner/item.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:provider/provider.dart';

class ViewUserWinner extends StatelessWidget {
  const ViewUserWinner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          //? Label
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF4C5872),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFffffff)),
            ),
            alignment: Alignment.center,
            child: Text(
              context.lcz.labelWinnerResultScene,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          //? User
          ComponentWinnerItem(context.read<WinnersProvider>().dataPage.winners.winnerUser),
        ],
      ),
    );
  }
}
