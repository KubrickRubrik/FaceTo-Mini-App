part of '../stat.dart';

class _DescriptionWinnersStat extends StatelessWidget {
  const _DescriptionWinnersStat({
    required this.label,
    required this.color,
    required this.data,
  });
  final String label;
  final int color;
  final MinMidMax data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ToastMassage.toast(context, context.lcz.helpSwipeBar);
      },
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF2E2E2E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            //? Label
            Flexible(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Color(color),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            //? Time
            Flexible(
              child: Container(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${data.swipe} ",
                      style: const TextStyle(
                        color: Color(0xFFFCD6FA),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ConfigNumbers.convertTime(data.time),
                      style: const TextStyle(
                        color: Color(0xFFFFEDB4),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
