part of '../winners.dart';

class NoneViewWinnersPage extends StatefulWidget {
  const NoneViewWinnersPage({super.key});

  @override
  State<NoneViewWinnersPage> createState() => _NoneViewWinnersPageState();
}

class _NoneViewWinnersPageState extends State<NoneViewWinnersPage> {
  bool isView = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isView = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        curve: Curves.ease,
        height: isView ? 150 : 60,
        width: isView ? null : 60,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        child: Column(
          children: [
            //? App bar
            const TabBarWinner(),
            Flexible(
              child: InkWell(
                onTap: () async {
                  Future.microtask(() async {
                    final path = Uri.parse(ConfigLinks.parseLinks(ConfigLinks.links.linkFaceTo));
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
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //? Logo
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFF696969),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(AppImages.imageFaceto),
                          ),
                        ),
                        const SizedBox(width: 5),
                        //? Lebel
                        RichText(
                          text: TextSpan(
                            text: context.lcz.descriptionNoneWinners,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                            children: const [
                              TextSpan(
                                text: " FaceTo Pro",
                                style: TextStyle(
                                  color: Color(0xFF156EA8),
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
