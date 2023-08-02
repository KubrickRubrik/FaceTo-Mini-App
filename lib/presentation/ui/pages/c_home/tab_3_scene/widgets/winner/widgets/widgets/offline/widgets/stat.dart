import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:facetomini/core/config/numbers.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:provider/provider.dart';

class StatWinnerPlace extends StatelessWidget {
  const StatWinnerPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.only(left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //? MIN SCENE
                _MinSecondsItem(),
                //? USER TIME
                SizedBox(height: 5),
                _UserTime(),
                //? DIFFERENCE
                SizedBox(height: 5),
                _Difference(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Minimum travel time for a given scene
class _MinSecondsItem extends StatelessWidget {
  const _MinSecondsItem();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.componentWinnerRecord);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: Icon(
                  AppIcons.timer,
                  color: Color(0xFF384869),
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              child: Text(
                '13:13:13',
                // ConfigNumbers.convertTime(time),
                // APP_UTILITY.convertTime(Provider.of<SceneBloc>(context).winnerOffline.recordTime),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF029bf9),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// User transit time for a given scene
class _UserTime extends StatelessWidget {
  const _UserTime();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.componentWinnerTime);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Center(
                child: Icon(
                  AppIcons.userTime,
                  color: Color(0xFF384869),
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: 5),
            Flexible(
              child: Text(
                "13:13:13",
                // ConfigNumbers.convertTime(time)
                // APP_UTILITY.convertTime(Provider.of<SceneBloc>(context, listen: false).winnerOffline.userTime),
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF8718e1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Difference between custom travel time and minimum travel time
class _Difference extends StatelessWidget {
  const _Difference();

  @override
  Widget build(BuildContext context) {
    return Selector<Scene, int>(
      selector: (_, Model) => 1,
      builder: (_, diffTime, child) {
        ({String sim, int color}) data = switch (diffTime) {
          > 0 => (sim: "+", color: 0xFFF54500),
          < 0 => (sim: "-", color: 0xFF2C9E10),
          _ => (sim: "", color: 0xFF727272),
        };

        return InkWell(
          onTap: () {
            ToastMassage.toast(context, context.lcz.componentWinnerDiffTime);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Icon(
                      AppIcons.minTime,
                      color: Color(0xFF384869),
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "${data.sim}${ConfigNumbers.convertTime(diffTime.abs())}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(data.color),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
