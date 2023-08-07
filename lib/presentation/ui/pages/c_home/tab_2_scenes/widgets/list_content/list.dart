import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_2_scenes/widgets/list_content/item/item.dart';
import 'package:provider/provider.dart';

class ListContentScenes extends StatelessWidget {
  const ListContentScenes({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Selector<ScenesProvider, (int, int)>(
      selector: (_, Model) => (Model.pageData.useIdSeries, Model.pageData.countScene),
      builder: (_, data, __) {
        return ListView(
          padding: const EdgeInsets.only(top: 50, bottom: 0, left: 5, right: 5),
          controller: controller,
          physics: const BouncingScrollPhysics(),
          // separatorBuilder: (BuildContext context, int index) {
          //   return const SizedBox(height: 8);
          // },
          // itemCount: length,
          // itemBuilder: (context, index) {
          //   return ItemScene(index);
          // },
          children: List.generate(data.$2, (index) {
            return ItemScene(index);
          }),
        );
      },
    );
  }
}
