// ignore_for_file: avoid_print

import 'package:facetomini/presentation/locator/locator.dart';
import 'package:facetomini/presentation/sound/sound.dart';
import 'package:flutter/material.dart';
import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/use_cases/session.dart';
import 'package:facetomini/presentation/manager/providers/session/entity/app_session.dart';

part 'state.dart';

final class SessionProvider extends ChangeNotifier with _State {
  SessionProvider(this._sessionCase);
  final SessionCase _sessionCase;

  // Session authorization
  Future<void> authorization() async {
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction);
    final response = await _sessionCase.authorization('ru');
    _setActions(ActionStatus.isDone);
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      sessionUser.authorized(response.data!);
      locator<SoundController>().setSound(sessionUser.settings.enabledSound);
    }
  }

  // Set theme
  Future<void> setTheme(CurrentThemeApp value) async {
    if (value == super.sessionUser.settings.theme) return;
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    final response = await _sessionCase.setTheme(value.name);
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
    } else {
      super.sessionUser.settings.theme = value;
      notifyListeners();
    }
  }

  // Set user locale
  Future<void> setLocale(AvailableAppLocale value) async {
    if (value == super.sessionUser.settings.locale) return;
    if (super.actionStatus == ActionStatus.isAction) return;
    _setActions(ActionStatus.isAction, false);
    final response = await _sessionCase.setLocale(value.name);
    _setActions(ActionStatus.isDone, false);
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
    _setActions(ActionStatus.isAction, false);
    final swithSound = !super.sessionUser.settings.enabledSound;
    final response = await _sessionCase.setSound(swithSound);
    _setActions(ActionStatus.isDone, false);
    if (response.fail != null || response.data == null) {
      // sessionUser.stateAuthorization = StateApp.errorRepairs;
    } else {
      // sessionUser.authorized(response.data!);
      super.sessionUser.settings.enabledSound = val;
      locator<SoundController>().setSound(val);
      notifyListeners();
    }
  }

  // Setting the operation status
  void _setActions(ActionStatus value, [bool isUpdate = true]) {
    actionStatus = value;
    if (isUpdate) notifyListeners();
  }

  //
  void setViewMenuSettings() {
    super.sessionUser.settings.setViewMenu();
    notifyListeners();
  }
}
