import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/vo/scene.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_3_scene/scene.dart';
import 'package:facetomini/presentation/manager/author/author.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';

import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:facetomini/presentation/manager/pages/a_home/tab_2_scenes/scenes.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/images.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';
part 'widgets/line.dart';
part 'widgets/stat.dart';
part 'widgets/banner.dart';

class ItemScene extends StatelessWidget {
  const ItemScene(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            bottom: 0,
            left: 5,
            right: 5,
            child: LineScene(),
          ),
          Column(
            children: [
              const SizedBox(height: 5),
              AspectRatio(
                aspectRatio: 1.3,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 3,
                      child: _Stat(index),
                    ),
                    Flexible(
                      flex: 4,
                      child: _Banner(index),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
