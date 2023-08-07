part of '../stat.dart';

class _LineGraph extends StatelessWidget {
  const _LineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    InfoStat infoStat = Provider.of<CM_WinnersBloc>(context).infoStat;

    return LineChartBarData(
      show: (infoStat.min.swipe != 0 && infoStat.mid.time != 0 && infoStat.max.swipe != 0) ? true : false,
      spots: [
        FlSpot(double.parse("${infoStat.min.time}"), double.parse("${infoStat.min.swipe}")),
        FlSpot(double.parse("${infoStat.mid.time}"), double.parse("${infoStat.mid.swipe}")),
        FlSpot(double.parse("${infoStat.max.time}"), double.parse("${infoStat.max.swipe}")),
      ],
      isCurved: true,
      colors: [
        Color(0xFF00C700),
        Color(0xFF0099FF),
        Color(0xFFFF1100),
      ],
      barWidth: 10,
      isStrokeCapRound: true,
      dotData: FlDotData(
          show: true,
          //! Point
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 2,
              color: Color(0xFFFFFFFF),
            );
          }),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Color(0x4800FF00),
          Color(0x3D00EEFF),
          Color(0x4DFF1100),
        ],
      ),
    );
  }
}
