import 'package:flutter/material.dart';
import 'package:facetomini/core/config/links.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/ui/components/toast.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/controller/controller.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoRatingApp extends StatelessWidget {
  const InfoRatingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<PagesControllerProvider, bool>(
      selector: (_, Model) => Model.viewAdditionalPage.isViewInfoRatingPage,
      builder: (_, isViewPage, __) {
        return switch (isViewPage) {
          false => const SizedBox.shrink(),
          true => const _ViewPage(),
        };
      },
      child: const _ViewPage(),
    );
  }
}

class _ViewPage extends StatefulWidget {
  const _ViewPage();

  @override
  State<_ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<_ViewPage> {
  bool stateView = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (super.mounted) {
        stateView = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PagesControllerProvider>().setViewInfoRatingPage();
      },
      child: Container(
        color: const Color(0xAA000000),
        alignment: Alignment.center,
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstCurve: Curves.elasticInOut,
          secondCurve: Curves.elasticInOut,
          sizeCurve: Curves.elasticInOut,
          firstChild: const _AboutRatingApp(),
          secondChild: const SizedBox(),
          crossFadeState: (stateView) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}

class _AboutRatingApp extends StatelessWidget {
  const _AboutRatingApp();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //! Ask by app
          const SizedBox(height: 5),
          SizedBox(
            width: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.lcz.infoRatingLabel_1,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                _spaces(),
                Text(
                  context.lcz.infoRatingLabel_2,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                _spaces(),
                Text(
                  context.lcz.infoRatingLabel_3,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                _spaces(),
                Text(
                  context.lcz.infoRatingLabel_4,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                _spaces(),
                Text(
                  context.lcz.infoRatingLabel_5,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                _spaces(),
                Text(
                  context.lcz.infoRatingLabel_6,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                _spaces(),
                Text(
                  context.lcz.infoRatingLabel_7,
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodySmall,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF2a2a2a),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Future.microtask(() async {
                  final path = Uri.parse(ConfigLinks.links.linkFaceTo);
                  if (await canLaunchUrl(path)) {
                    await launchUrl(path);
                    return true;
                  }
                  return false;
                }).then((isLounch) {
                  if (!isLounch) {
                    Clipboard.setData(ClipboardData(text: ConfigLinks.links.linkFaceTo));
                    ToastMassage.toast(context, context.lcz.infoCopy);
                  }
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 20),
                  Text(context.lcz.infoRatingInstall_1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      )),
                  const SizedBox(width: 15),
                  Container(
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(AppImages.imageFaceto),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _spaces() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      alignment: Alignment.center,
      child: Container(
        height: 4,
        width: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFF222222),
        ),
      ),
    );
  }
}
