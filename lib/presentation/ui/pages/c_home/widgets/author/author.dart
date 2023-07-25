import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/author/widgets/none_author.dart';
import 'package:facetomini/presentation/ui/pages/c_home/widgets/author/widgets/view_author/view_author.dart';
import 'package:facetomini/presentation/manager/pages/a_home/controller/controller.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/presentation/manager/author/author.dart';
import 'package:provider/provider.dart';

class ComponentAuthor extends StatelessWidget {
  const ComponentAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<PagesControllerProvider, bool>(
      selector: (_, Model) => Model.viewAdditionalPage.isViewInfoAuthorPage,
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

class _ViewPage extends StatelessWidget {
  const _ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthorProvider, StatusContent>(
      selector: (_, Model) => Model.statePage,
      builder: (_, statePage, __) {
        return switch (statePage) {
          StatusContent.isViewContent => const ViewAuthorPage(),
          _ => const NoneViewAuthorPage(),
        };
      },
    );
  }
}
