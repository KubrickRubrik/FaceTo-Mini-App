import 'package:facetomini/presentation/manager/author/entity/image.dart';
import 'package:facetomini/presentation/manager/author/entity/link.dart';
import 'package:facetomini/presentation/manager/author/entity/stat.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class AuthorProvider extends ChangeNotifier with _State {
  _setStatePage(StatusContent val) {
    statePage = val;
    notifyListeners();
  }
}
