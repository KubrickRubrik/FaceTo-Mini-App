import 'dart:math';

import 'package:flutter/material.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/controller.dart';
part 'widgets/user.dart';
part 'widgets/stat.dart';

class ComponentWinnerItemAuthor extends StatelessWidget {
  const ComponentWinnerItemAuthor(this.data, {super.key});
  final RecordUser data;

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
