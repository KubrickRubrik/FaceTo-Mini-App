part of '../../../stat.dart';

class _GraphSkils extends StatelessWidget {
  const _GraphSkils();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        //
        const SizedBox(width: 65),
        //? Left Stat
        Flexible(
          child: InkWell(
            onTap: () {
              ToastMassage.toast(context, context.lcz.helpBarGraph);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Flexible(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Spacer(
                              flex: 100 - Provider.of<CM_WinnersBloc>(context).infoStat.graph.flexRight,
                            ),
                            SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFffffff),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(
                                      AppIcons.group,
                                      size: 12,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    ConfigNumbers.shortValue(Provider.of<WinnersProvider>(context).infoStat.graph.countUsersMax),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex: Provider.of<WinnersProvider>(context).infoStat.graph.flexRight,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF0000),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            //? Profile
                            const SizedBox(height: 45),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),
        //? Right Stat
        Flexible(
          child: InkWell(
            onTap: () {
              ToastMassage.toast(context, context.lcz.helpBarGraph);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 45),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Spacer(
                            flex: 100 - Provider.of<WinnersProvider>(context).infoStat.graph.flexLeft,
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFffffff),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(
                                    AppIcons.group,
                                    size: 12,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  ConfigNumbers.shortValue(Provider.of<WinnersProvider>(context).infoStat.graph.countUsersMin),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            flex: Provider.of<WinnersProvider>(context).infoStat.graph.flexLeft,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xFF73FF00),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          //? Profile
                          const SizedBox(height: 45),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 65),
      ],
    );
  }
}
