import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/author/author.dart';
import 'package:facetomini/presentation/manager/entities/champion.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:provider/provider.dart';
part 'widgets/user.dart';
part 'widgets/stat.dart';

/// The widget is used to display the winner data
/// (user data) of the application, if available.
class ComponentWinnerItem extends StatelessWidget {
  const ComponentWinnerItem(this.data, {super.key});
  final ChampionData data;

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
