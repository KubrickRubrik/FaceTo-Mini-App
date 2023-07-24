import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/scene.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
part 'widgets/banner.dart';
part 'widgets/description.dart';
part 'widgets/rating.dart';
part 'widgets/count_scenes.dart';
part 'widgets/status_series.dart';

class ItemScene extends StatelessWidget {
  const ItemScene(this.item, {super.key});
  final SceneEntity item;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
        child: InkWell(
          onTap: () {},
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
                    child: _Banner(item),
                  ),
                  //! Author & stat
                  Positioned(
                    top: 7,
                    left: 7,
                    child: _DescriptionSeries(),
                  ),
                  //! Rating
                  Positioned(
                    bottom: 7,
                    left: 7,
                    child: _RatingSeries(),
                  ),
                  //! COUNT SCENES
                  Positioned(
                    top: 7,
                    right: 7,
                    child: _CountScenes(),
                  ),
                  //! Status
                  Positioned(
                    bottom: 7,
                    right: 7,
                    child: _StatusSeries(),
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
  const _Spacer({super.key});

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
