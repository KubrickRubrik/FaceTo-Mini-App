import 'package:flutter/material.dart';
import 'package:facetomini/domain/entities/author.dart';
import 'package:facetomini/domain/use_cases/author.dart';
import 'package:facetomini/presentation/manager/author/entity/image.dart';
import 'package:facetomini/presentation/manager/author/entity/link.dart';
import 'package:facetomini/presentation/manager/author/entity/stat.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class AuthorProvider extends ChangeNotifier with _State {
  AuthorProvider(this._authorCase);
  final AuthorCase _authorCase;

  // Series request
  Future<void> getAuthor(int idAuthor) async {
    if (pageData.idApp == idAuthor) {
      return;
    }
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final response = await _authorCase.getAuthor(idAuthor);
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      _setStatusPage(StatusContent.isNoneContent);
    } else {
      pageData.overwritingPageData(response.data!);
      _setStatusPage(StatusContent.isViewContent);
    }
  }

  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  _setStatusPage(StatusContent val) {
    statusPage = val;
    notifyListeners();
  }

  // Link description display
  setViewLinks(SectionLink? link) async {
    if (link != null) {
      isViewDescriptionLink = true;
      sectionLink.setData(link);
    } else {
      isViewDescriptionLink = false;
    }
    notifyListeners();
  }
}
