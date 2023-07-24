import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/domain/entities/app.dart';

class AppSession {
  AppSession();
  var stateAuthorization = StateApp.isNotAuth;
  int idApp = 0;
  final settings = AppSettings();

  void authorized(SessionEntity inpuData) {
    stateAuthorization = StateApp.isAuth;
    idApp = inpuData.idApp;
    settings.enabledSound = inpuData.enabledSound;
    settings.locale = inpuData.locale;
    settings.theme = inpuData.theme;
  }
}

class AppSettings {
  var theme = CurrentThemeApp.light;
  var locale = AvailableAppLocale.en;
  var enabledSound = true;

  switchSound() => enabledSound = !enabledSound;
}
