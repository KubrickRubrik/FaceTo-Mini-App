import 'dart:math';
import 'package:flutter/material.dart';

import 'package:facetomini/presentation/manager/entities/champion.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
part 'widgets/user.dart';
part 'widgets/stat.dart';

class ComponentWinnerItemAuthor extends StatelessWidget {
  const ComponentWinnerItemAuthor(this.data, {super.key});
  final ChampionData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? Position & time
        _StatData(data),
        //? User
        _UserData(data),
      ],
    );
  }
}
