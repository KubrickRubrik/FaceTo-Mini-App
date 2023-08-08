part of '../../controller.dart';

class _OnlineWinnerSection extends StatelessWidget {
  const _OnlineWinnerSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (context.read<SceneProvider>().pageData.winner.data.online.winnerRecordUser.idApp != 0) ...[
            //! Label
            const _LabelWinnerSection(),
            const SizedBox(height: 5),
            //! RECORD USER
            ComponentWinnerItem(context.read<SceneProvider>().pageData.winner.data.online.winnerRecordUser),
          ],
          //! VIEW USER
          const _UserResult(),
        ],
      ),
    );
  }
}

class _LabelWinnerSection extends StatelessWidget {
  const _LabelWinnerSection();

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
  const _UserResult();

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
        ComponentWinnerItemAuthor(context.read<SceneProvider>().pageData.winner.data.online.winnerViewUser),
      ],
    );
  }
}
