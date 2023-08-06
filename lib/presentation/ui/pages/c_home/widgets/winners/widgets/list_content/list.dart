import 'package:facetomini/presentation/ui/pages/c_home/widgets/winners/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/winners/widgets/list_content/widgets/stat/stat.dart';

class ListContentWinners extends StatefulWidget {
  const ListContentWinners({super.key});

  @override
  State<ListContentWinners> createState() => _ListContentWinnersState();
}

class _ListContentWinnersState extends State<ListContentWinners> {
  bool isView = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isView = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        curve: Curves.ease,
        height: isView ? MediaQuery.of(context).size.height - 50 : 60,
        width: isView ? null : 60,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        child: const Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                TabBarWinner(),
                // Flexible(
                //   child: _ListWinner(context),
                // ),
                // _ViewUserWinner(context),
              ],
            ),
            Positioned(
              top: 50,
              bottom: 0,
              left: 0,
              right: 0,
              child: ViewInfoStat(),
            ),
          ],
        ),
      ),
    );
  }
}
