import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/use_cases/session.dart';
import 'package:facetomini/presentation/manager/session/entity/app_session.dart';

part 'state.dart';

final class SessionProvider extends ChangeNotifier with _State {
  SessionProvider(this._sessionCase);
  final SessionCase _sessionCase;

  // Session authorization
  Future<void> authorization() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    setActions(ActionStatus.isAction);
    final response = await _sessionCase.authorization('ru');
    setActions(ActionStatus.isDone);
    if (response.fail != null || response.data == null) {
      sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      sessionUser.authorized(response.data!);
    }
  }

  // Set theme
  Future<void> setTheme(CurrentThemeApp value) async {
    if (value == super.sessionUser.settings.theme) return;
    if (super.actionStatus == ActionStatus.isAction) return;
    setActions(ActionStatus.isAction, false);
    final response = await _sessionCase.setTheme(value.name);
    setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      // sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      // sessionUser.authorized(response.data!);
      super.sessionUser.settings.theme = value;
      notifyListeners();
    }
  }

  // Set user locale
  Future<void> setLocale(AvailableAppLocale value) async {
    if (value == super.sessionUser.settings.locale) return;
    if (super.actionStatus == ActionStatus.isAction) return;
    setActions(ActionStatus.isAction, false);
    final response = await _sessionCase.setLocale(value.name);
    setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      // sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      // sessionUser.authorized(response.data!);
      super.sessionUser.settings.locale = value;
      notifyListeners();
    }
  }

  // Set on/off sound
  Future<void> setSound(bool val) async {
    if (super.actionStatus == ActionStatus.isAction) return;
    setActions(ActionStatus.isAction, false);
    final swithSound = !super.sessionUser.settings.enabledSound;
    final response = await _sessionCase.setSound(swithSound);
    setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      // sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      // sessionUser.authorized(response.data!);
      super.sessionUser.settings.enabledSound = val;
      notifyListeners();
    }
  }

  //
  void setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  //
  void setViewMenuSettings() {
    super.sessionUser.settings.setViewMenu();
    notifyListeners();
  }
}
