import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/links.dart';
import 'package:facetomini/presentation/manager/author/author.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/presentation/ui/components/icons.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:provider/provider.dart';
part 'widgets/spin.dart';
part 'widgets/data.dart';

class ViewAuthorPage extends StatelessWidget {
  const ViewAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PagesControllerProvider>(context, listen: false).setViewInfoAuthorPage();
      },
      child: Container(
        color: const Color(0xAA000000),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 400,
            child: Column(
              children: [
                //! Spin
                const _SpinAuthor(),
                //! Author
                const _DataAuthor(),
                //! View Link
                _ViewLink(),

                //! Link
                Container(
                  constraints: const BoxConstraints(minHeight: 60),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 7,
                    runSpacing: 7,
                    children: (Provider.of<CM_AuthorBloc>(context).stateSpinPage == ViewStatusPage.load)
                        ? [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xFFDBDADA),
                                border: Border.all(width: 1.5, color: const Color(0xFFffffff)),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            )
                          ]
                        : _listWidgetLink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
