import 'package:flutter/material.dart';
import 'package:facetomini/presentation/manager/providers/pages/c_home/additions/author/entity/link.dart';
import 'package:facetomini/domain/entities/vo/author.dart';
import 'package:facetomini/domain/entities/dto/author.dart';
import 'package:facetomini/domain/use_cases/author.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class AuthorProvider extends ChangeNotifier with _State {
  AuthorProvider(this._authorCase);
  final AuthorCase _authorCase;

  // Series request
  Future<void> getAuthor(int idAuthor) async {
    print("GET AUTHOR $idAuthor");
    if (pageData.author.idApp == idAuthor) {
      return;
    }
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    _setStatusPage(StatusContent.isLoadContent);
    final response = await _authorCase.getAuthor(AuthorDTO(idAuthor: idAuthor));
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
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
    isViewDescriptionLink = false;
    notifyListeners();
  }

  // Link description display
  setViewLinks(LinkAuthor? link) async {
    if (link != null) {
      isViewDescriptionLink = true;
      pageData.sectionLink.setData(link);
    } else {
      isViewDescriptionLink = false;
    }
    notifyListeners();
  }
}
