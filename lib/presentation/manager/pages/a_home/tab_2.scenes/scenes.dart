import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
part 'state.dart';

final class ScenesProvider extends ChangeNotifier with _State {
  // Setting page status when loading data
  void _setStatusPage(StatusContent val) {
    statusPage = val;
    notifyListeners();
  }

  // Setting page content status when data is loaded
  void _setStatusContentPage(StatusContent val) {
    statusContentPage = val;
    notifyListeners();
  }
}
