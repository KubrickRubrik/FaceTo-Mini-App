import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_1_series/widgets/list_content/item/item.dart';

class ListContentSeries extends StatelessWidget {
  const ListContentSeries({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 50, bottom: 0, left: 5, right: 5),
      controller: controller,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ItemSeries();
      },
    );
  }
}
