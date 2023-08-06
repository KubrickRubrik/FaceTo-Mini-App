part of '../stat.dart';

class _PublicChar extends StatelessWidget {
  const _PublicChar({super.key});

 if (Provider.of<CM_WinnersBloc>(context).infoStat.publicState == 0) return const SizedBox();
    //
    String labelCharacteristics = '';
    String valCharacteristics = '';

    labelCharacteristics = APP_STRING.labelCharPublicScenes;
    switch (Provider.of<CM_WinnersBloc>(context).infoStat.publicState) {
      case 1:
        valCharacteristics = APP_STRING.charPublicScenes_1;
        break;
      case 2:
        valCharacteristics = APP_STRING.charPublicScenes_2;
        break;
      case 3:
        valCharacteristics = APP_STRING.charPublicScenes_3;
        break;
      case 4:
        valCharacteristics = APP_STRING.charPublicScenes_4;
        break;
    }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Label
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 50,
          alignment: Alignment.center,
          child: Text(
            labelCharacteristics,
            style: const TextStyle(
              color: Color(0xFFffffff),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        //!
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            valCharacteristics,
            style: const TextStyle(
              color: Color(0xFFffffff),
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
