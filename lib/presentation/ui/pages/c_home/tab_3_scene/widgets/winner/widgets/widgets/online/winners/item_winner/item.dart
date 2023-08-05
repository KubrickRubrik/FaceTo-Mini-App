import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/author/author.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/entity/winner/entity/data/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:provider/provider.dart';
part 'widgets/user.dart';
part 'widgets/stat.dart';

class ComponentWinnerItem extends StatelessWidget {
  const ComponentWinnerItem(this.data, {super.key});
  final UserRecordsData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? Position & time
        _StatData(data),
        //? User
        _UserData(data),
        const SizedBox(height: 8),
      ],
    );
  }
}
