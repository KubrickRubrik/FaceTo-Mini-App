import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/author/author.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/author/widgets/view_author/widgets/download_data/download_data.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/ui/components/themes/controller.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/author/widgets/view_author/widgets/downloaded_data/downloaded_data.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/controller/controller.dart';
import 'package:provider/provider.dart';
part 'widgets/spin.dart';

class ViewAuthorPage extends StatelessWidget {
  const ViewAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PagesControllerProvider>(context, listen: false).setViewInfoAuthorPage();
      },
      child: Align(
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
                //! Author downloaded data
                Selector<AuthorProvider, StatusContent>(
                  selector: (_, Model) => Model.statusPage,
                  builder: (_, statePage, child) {
                    return switch (statePage) {
                      StatusContent.isLoadContent => const DownloadData(),
                      StatusContent.isViewContent => const DownloadedData(),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
