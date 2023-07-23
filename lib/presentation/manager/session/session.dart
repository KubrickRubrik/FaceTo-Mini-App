import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/repository/authorization.dart';
import 'package:facetomini/presentation/manager/session/entity/app_session.dart';
import 'package:flutter/material.dart';

part 'state.dart';

final class SessionProvider extends ChangeNotifier with _State {
  SessionProvider(this._authorizationCase);
  final AuthorizationRepository _authorizationCase;
  //
  Future<void> authorization() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    setActions(ActionStatus.isAction);
    final response = await _authorizationCase.authorization();
    setActions(ActionStatus.isDone);
    if (response.fail != null || response.data == null) {
      sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      sessionUser.authorized(response.data!);
    }
  }

  // Set theme
  void setTheme(CurrentThemeApp value) {
    if (value != super.sessionUser.settings.theme) {
      super.sessionUser.settings.theme = value;
      notifyListeners();
    }
  }

  // Set language
  void setLocale(AvailableAppLocale value) {
    if (value != super.sessionUser.settings.locale) {
      super.sessionUser.settings.locale = value;
      notifyListeners();
    }
  }

  // Set on/off sound
  void setSound(bool val) {
    super.sessionUser.settings.enabledSound = val;
    notifyListeners();
  }

  //
  void setActions(ActionStatus value) {
    actionStatus = value;
    notifyListeners();
  }

  //
  void setViewMenuSettings() {
    super.sessionUser.settings.setViewMenu();
    notifyListeners();
  }
}
