import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_3_scene/widgets/winner/widgets/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
part 'widgets/user.dart';
part 'widgets/stat.dart';

class ComponentWinnerItem extends StatelessWidget {
  const ComponentWinnerItem(this.data, {super.key});
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
