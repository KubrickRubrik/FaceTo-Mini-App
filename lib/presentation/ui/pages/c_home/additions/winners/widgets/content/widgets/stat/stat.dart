import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/entities/stat.dart';

import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';

import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/winners/winners.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
//
part 'widgets/skils/skils.dart';
part 'widgets/skils/widgets/label.dart';
part 'widgets/skils/widgets/y_coord.dart';
part 'widgets/skils/widgets/x_coord.dart';
part 'widgets/skils/widgets/graph.dart';
//
part 'widgets/description.dart';
part 'widgets/line_graph.dart';
part 'widgets/char.dart';

class ViewInfoStat extends StatelessWidget {
  const ViewInfoStat({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WinnersProvider, bool>(
      selector: (_, Model) => Model.dataPage.isDisplayStat,
      builder: (_, isDisplayStat, child) {
        return switch (isDisplayStat) {
          false => const SizedBox.shrink(),
          true => child!,
        };
      },
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xB1000000),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10, bottom: 7, left: 0, right: 0),
              child: Column(
                children: [
                  const _SkilsWinnersStat(),
                  const SizedBox(height: 20),
                  _DescriptionWinnersStat(
                    label: context.lcz.minDataStatistics,
                    color: 0xFF00FF00,
                    data: context.read<WinnersProvider>().dataPage.winners.stat.min,
                  ),
                  spaces(),
                  _DescriptionWinnersStat(
                    label: context.lcz.midDataStatistics,
                    color: 0xFF0084FF,
                    data: context.read<WinnersProvider>().dataPage.winners.stat.mid,
                  ),
                  spaces(),
                  _DescriptionWinnersStat(
                    label: context.lcz.maxDataStatistics,
                    color: 0xFFFF2600,
                    data: context.read<WinnersProvider>().dataPage.winners.stat.max,
                  ),
                  //
                  const _LineGraph(),
                  const _PublicChar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget spaces() {
    return Container(
      height: 4,
      width: 4,
      decoration: BoxDecoration(
        color: const Color(0xFF252525),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
