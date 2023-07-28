part of '../../controller.dart';

class _OnlineWinnerSection extends StatelessWidget {
  const _OnlineWinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (Provider.of<SceneBloc>(context).winnerRecordUser.idApp != 0) ...[
          //! Label
          const _LabelWinnerSection(),
          const SizedBox(height: 5),
          //! RECORD USER
          ComponentWinnerItem(RecordUser()),
          // CM_WinnerItem(Provider.of<SceneBloc>(context).winnerRecordUser),
          // ],
          //! VIEW USER
          const _UserResult(),
        ],
      ),
    );
  }
}

class _LabelWinnerSection extends StatelessWidget {
  const _LabelWinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFE4E4E4),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: const Color(0xFFffffff)),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            context.lcz.labelWinnerScene,
            style: const TextStyle(
              color: Color(0xFF384869),
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: () {
              Future.microtask(() async {
                final path = Uri.parse(ConfigLinks.links.linkFaceTo);
                if (await canLaunchUrl(path)) {
                  await launchUrl(path);
                  return true;
                } else {
                  return false;
                }
              }).then((isLounch) {
                if (!isLounch) ToastMassage.toast(context, context.lcz.actionNotAvailable, code: TypeMassage.warning);
              });
            },
            child: const Text(
              "FaceTo Pro",
              style: TextStyle(
                color: Color(0xFF751C71),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// User game result
class _UserResult extends StatelessWidget {
  const _UserResult({super.key});

  @override
  Widget build(BuildContext context) {
    // if (Provider.of<SceneBloc>(context).winnerViewUser.idApp != 0)
    return Column(
      children: [
        //! Label view user
        Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xFFE4E4E4),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                context.lcz.labelWinnerResultScene,
                style: const TextStyle(
                  color: Color(0xFF384869),
                  fontSize: 16,
                ),
              ),
              const Text(
                "FaceTo Mini",
                style: TextStyle(
                  color: Color(0xFF751C71),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        ComponentWinnerItemAuthor(RecordUser()),
        // CM_WinnerItemAuthor(Provider.of<SceneBloc>(context).winnerViewUser),
      ],
    );
  }
}

///

class RecordUser {
  int? idApp = 0;
  String nick = '';
  // ImageProfile image = ImageProfile();
  int pos = 0;
  int xp = 0;
  int time = 0;
  int toNextTime = 0;
  int toLastTime = 0;
  int _diff = 0;

  setData(Map _data, int _toNextTime, int _toLastTime) {
    // 15,11
    idApp = _data['id_app'];
    nick = _data['nick'];
    pos = _data['stat']['pos'];
    time = _data['stat']['time'];
    xp = _data['stat']['xp'];
    // image.setLogoData(_data);
    toNextTime = time - _toNextTime;
    _diff = _toLastTime - time;
    toLastTime = (_diff > 0) ? _diff : 0;
  }

  void clear() {
    idApp = 0;
  }
}
