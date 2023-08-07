import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';

class LoadWinnersPage extends StatelessWidget {
  const LoadWinnersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        child: Image.asset(
          AppImages.spinDark,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
