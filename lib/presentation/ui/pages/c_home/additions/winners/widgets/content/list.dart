import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/winners/widgets/content/widgets/winners/list.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/winners/widgets/tabbar.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/winners/widgets/content/widgets/stat/stat.dart';

class ContentWinners extends StatefulWidget {
  const ContentWinners({super.key});

  @override
  State<ContentWinners> createState() => _ContentWinnersState();
}

class _ContentWinnersState extends State<ContentWinners> {
  bool isView = false;
  bool isViewContent = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isView = true;
      setState(() {});
      Future.delayed(const Duration(milliseconds: 350), () {
        isViewContent = true;
        setState(() {});
      });
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
        child: (!isViewContent)
            ? const SizedBox()
            : const Stack(
                children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      TabBarWinner(),
                      Flexible(child: ListWinners()),
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
