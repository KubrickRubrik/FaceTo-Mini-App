part of '../item.dart';

class _StatData extends StatelessWidget {
  const _StatData(this.data);
  final RecordUser data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          //? Position
          const SizedBox(width: 5),
          _LabelStat(data.pos),
          //? Difference
          _DifferenceStat(data),
          //? Time
          _TimeStat(data.time),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}

/// Label for statistics
class _LabelStat extends StatelessWidget {
  const _LabelStat(this.position);
  final int position;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF1F1F1F),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Text(
          "$position ${context.lcz.componentWinnerPlases}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

/// Difference
class _DifferenceStat extends StatelessWidget {
  const _DifferenceStat(this.data);
  final RecordUser data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          //? Edge
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 1,
                color: const Color(0xFF1F1F1F),
              ),
            ),
          ),
          //? Time
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                toNextTime(context),
                const SizedBox(height: 5),
                //? Minus
                topPeviousTime(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // The time the player is behind the user in front of him
  Widget topPeviousTime(BuildContext context) {
    if (data.toLastTime == 0) return const SizedBox(height: 15);
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.componentWinnerMinus);
      },
      child: Container(
        height: 15,
        // color: Colors.red,
        alignment: Alignment.topCenter,
        child: Text(
          "-${ConfigNumbers.convertTime(data.toLastTime)}",
          style: const TextStyle(
            color: Color(0xFF3FAD14),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Difference between player's time and user's time after him
  Widget toNextTime(BuildContext context) {
    if (data.pos == 1 || data.toNextTime == 0) return const SizedBox(height: 15);
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.componentWinnerPlus);
      },
      child: SizedBox(
        height: 15,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "+${ConfigNumbers.convertTime(data.toNextTime)}",
            style: const TextStyle(
              color: Color(0xFFDB0B0B),
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

/// Puzzle completion time
class _TimeStat extends StatelessWidget {
  const _TimeStat(this.time);
  final int time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.componentWinnerTime);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
            border: Border.all(color: const Color(0xFF1F1F1F)),
          ),
          alignment: Alignment.center,
          child: Text(
            ConfigNumbers.convertTime(time),
            style: const TextStyle(
              color: Color(0xFF1F1F1F),
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
