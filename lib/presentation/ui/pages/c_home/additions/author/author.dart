import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/author/author.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/author/widgets/none_author.dart';
import 'package:facetomini/presentation/ui/pages/c_home/additions/author/widgets/view_author/view_author.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/controller/controller.dart';
import 'package:facetomini/core/config/entity.dart';
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
  const _ViewPage();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xCC000000),
      ),
      child: Selector<AuthorProvider, StatusContent>(
        selector: (_, Model) => Model.statusPage,
        builder: (_, statePage, __) {
          return switch (statePage) {
            StatusContent.isViewContent || StatusContent.isLoadContent => const ViewAuthorPage(),
            _ => const NoneViewAuthorPage(),
          };
        },
      ),
    );
  }
}
