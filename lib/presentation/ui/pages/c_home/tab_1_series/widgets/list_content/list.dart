import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/ui/pages/c_home/tab_1_series/widgets/list_content/item/item.dart';
import 'package:provider/provider.dart';

class ListContentSeries extends StatelessWidget {
  const ListContentSeries({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Selector<SeriesProvider, int>(
      selector: (_, Model) => Model.pageData.listSeries.length,
      builder: (_, length, __) {
        return ListView.separated(
          padding: const EdgeInsets.only(top: 57, bottom: 32, left: 5, right: 5),
          controller: controller,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
          itemCount: length,
          itemBuilder: (context, index) {
            return ItemSeries(index);
          },
        );
      },
    );
  }
}
