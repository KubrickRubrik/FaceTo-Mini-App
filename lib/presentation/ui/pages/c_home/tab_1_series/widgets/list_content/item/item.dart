import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_1_series/series.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:provider/provider.dart';
part 'widgets/banner.dart';
part 'widgets/description.dart';
part 'widgets/rating.dart';
part 'widgets/count_scenes.dart';
part 'widgets/status_series.dart';

class ItemSeries extends StatelessWidget {
  const ItemSeries(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final item = context.read<SeriesProvider>().pageData.listSeries[index];
        context.read<ScenesProvider>().getScenes(item.idSeries).then((isDone) {
          if (isDone == null) return;
          if (!isDone) {
            // If the series does not have available prices
            ToastMassage.toast(context, context.lcz.scenesNotAvailable, code: TypeMassage.error);
            return;
          }
          context.read<PagesControllerProvider>().swipeToScenes();
        });
      },
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Color(0xFFeeeeee),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 4.0),
                blurRadius: 10,
                spreadRadius: -8,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: ColoredBox(
              color: Colors.white,
              child: Stack(
                children: [
                  //! Banner
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _Banner(index),
                  ),
                  //! Author & stat
                  Positioned(
                    top: 7,
                    left: 7,
                    child: _DescriptionSeries(index),
                  ),
                  //! Rating
                  Positioned(
                    bottom: 7,
                    left: 7,
                    child: _RatingSeries(index),
                  ),
                  //! COUNT SCENES
                  Positioned(
                    top: 7,
                    right: 7,
                    child: _CountScenes(index),
                  ),
                  //! Status
                  Positioned(
                    bottom: 7,
                    right: 7,
                    child: _StatusSeries(index),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//! Dot between element
class _Spacer extends StatelessWidget {
  const _Spacer();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 2,
      width: 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xFFBBBBBB),
      ),
    );
  }
}
