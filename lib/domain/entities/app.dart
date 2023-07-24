import 'package:facetomini/core/config/entity.dart';
import 'package:facetomini/core/config/locale.dart';

class SessionEntity {
  final int idApp;
  final bool enabledSound;
  final AvailableAppLocale locale;
  final CurrentThemeApp theme;

  SessionEntity({
    required this.idApp,
    required int enabledSound,
    required String locale,
    required String theme,
  })  : enabledSound = enabledSound == 1,
        locale = ConfigLocalization.getByName(locale),
        theme = CurrentThemeApp.values.firstWhere(
          (element) => element.toString() == theme,
          orElse: () => CurrentThemeApp.light,
        );
}
