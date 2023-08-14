part of '../stat.dart';

class _LineGraph extends StatelessWidget {
  const _LineGraph();

  @override
  Widget build(BuildContext context) {
    final infoStat = context.read<WinnersProvider>().dataPage.winners.stat;
    // 1
    List<LineChartBarData> _linesBarData1() {
      final line = LineChartBarData(
        show: (infoStat.min.swipe != 0 && infoStat.mid.time != 0 && infoStat.max.swipe != 0) ? true : false,
        spots: [
          FlSpot(double.parse("${infoStat.min.time}"), double.parse("${infoStat.min.swipe}")),
          FlSpot(double.parse("${infoStat.mid.time}"), double.parse("${infoStat.mid.swipe}")),
          FlSpot(double.parse("${infoStat.max.time}"), double.parse("${infoStat.max.swipe}")),
        ],
        isCurved: true,
        colors: [
          const Color(0xFF00C700),
          const Color(0xFF0099FF),
          const Color(0xFFFF1100),
        ],

        barWidth: 10,
        isStrokeCapRound: true,
        dotData: FlDotData(
            show: true,
            //? Point
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 2,
                color: const Color(0xFFFFFFFF),
              );
            }),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            const Color(0x4800FF00),
            const Color(0x3D00EEFF),
            const Color(0x4DFF1100),
          ],
        ),
        //
      );
      return [line];
    }

    // 2
    LineChartData _sampleData() {
      final dataGrapg = context.read<WinnersProvider>().dataPage.winners.stat.graph;
      //? COORD X
      final intervalX = (dataGrapg.xAxis.interval / 1000).ceil() * 1000;
      final halfIntervalX = (intervalX / 2).ceil();
      final steepX = (dataGrapg.xAxis.minLimit / 1000).floor() * 1000;
      //
      final step_1X = steepX;
      final step_2X = steepX + 1 * intervalX;
      final step_3X = steepX + 2 * intervalX;
      final step_4X = steepX + 3 * intervalX;
      final step_5X = steepX + 4 * intervalX;
      final step_6X = steepX + 5 * intervalX;
      //? COORD Y
      final intervalY = dataGrapg.yAxis.interval.ceil();
      final halfIntervalY = (intervalY / 2).ceil();
      final step_1Y = dataGrapg.yAxis.minLimit;
      final step_2Y = dataGrapg.yAxis.minLimit + 1 * dataGrapg.yAxis.interval;
      final step_3Y = dataGrapg.yAxis.minLimit + 2 * dataGrapg.yAxis.interval;
      final step_4Y = dataGrapg.yAxis.minLimit + 3 * dataGrapg.yAxis.interval;
      final step_5Y = dataGrapg.yAxis.minLimit + 4 * dataGrapg.yAxis.interval;
      final step_6Y = dataGrapg.yAxis.minLimit + 5 * dataGrapg.yAxis.interval;
      //
      return LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: const Color(0xCC020202),
            fitInsideVertically: true,
            fitInsideHorizontally: true,
          ),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: double.parse("$intervalY"),
          verticalInterval: double.parse("$halfIntervalX"),
        ),
        titlesData: FlTitlesData(
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
          //? Bottom title
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            rotateAngle: -10,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xffdddddd),
              fontWeight: FontWeight.w400,
              fontSize: 9,
            ),
            margin: 10,
            interval: double.parse("$halfIntervalX"),
            getTitles: (value) {
              final item = value.toInt();
              String data = '';
              if (item == step_1X) data = (step_1X == 0) ? '0' : ConfigNumbers.setShortSecond(step_1X);
              if (item == step_2X) data = ConfigNumbers.setShortSecond(step_2X);
              if (item == step_3X) data = ConfigNumbers.setShortSecond(step_3X);
              if (item == step_4X) data = ConfigNumbers.setShortSecond(step_4X);
              if (item == step_5X) data = ConfigNumbers.setShortSecond(step_5X);
              if (item == step_6X) data = ConfigNumbers.setShortSecond(step_6X);
              return data;
            },
          ),
          //? Left title
          leftTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xffdddddd),
              fontSize: 9,
            ),
            margin: 10,
            interval: double.parse("$intervalY"),
            getTitles: (value) {
              int item = value.toInt();
              String data = '';
              if (item == step_1Y) data = ConfigNumbers.shortValue(step_1Y);
              if (item == step_2Y) data = ConfigNumbers.shortValue(step_2Y);
              if (item == step_3Y) data = ConfigNumbers.shortValue(step_3Y);
              if (item == step_4Y) data = ConfigNumbers.shortValue(step_4Y);
              if (item == step_5Y) data = ConfigNumbers.shortValue(step_5Y);
              if (item == step_6Y) data = ConfigNumbers.shortValue(step_6Y);
              return data;
            },
          ),
        ),
        axisTitleData: FlAxisTitleData(
          show: true,
          leftTitle: AxisTitle(
            showTitle: true,
            titleText: context.lcz.labelGraph2CoordX,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
          rightTitle: AxisTitle(
            showTitle: true,
            titleText: "",
          ),
          bottomTitle: AxisTitle(
            showTitle: true,
            titleText: context.lcz.labelGraph2CoordY,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: double.parse("$step_1X"),
        maxX: double.parse("${step_6X + halfIntervalX}"),
        minY: double.parse("$step_1Y"),
        maxY: double.parse("${step_6Y + halfIntervalY}"),
        lineBarsData: _linesBarData1(),
      );
    }

    // 3
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 10),
      child: Column(
        children: [
          //? Label
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              context.lcz.labelGraph_2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          //? Graph
          AspectRatio(
            aspectRatio: 1.8,
            child: LineChart(
              _sampleData(),
              swapAnimationDuration: const Duration(milliseconds: 350),
              swapAnimationCurve: Curves.linear,
            ),
          ),
        ],
      ),
    );
  }
}
