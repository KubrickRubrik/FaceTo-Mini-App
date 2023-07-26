import 'package:flutter/material.dart';
import 'package:facetomini/presentation/ui/components/extensions/econtext.dart';
import 'package:facetomini/core/config/entity.dart';
part 'list/dark.dart';
part 'list/light.dart';
part 'constant.dart';

/// The class for managing the application's theme
abstract final class ThemesController {
  // Setting and changing the theme on a page [StartPage]
  static ThemeData set(CurrentThemeApp value) {
    return switch (value) {
      CurrentThemeApp.dark => createDarkTheme(),
      CurrentThemeApp.light => createLightTheme(),
      _ => createLightTheme(),
    };
  }

  // All available themes
  static Map<CurrentThemeApp, String> defaultThemes(BuildContext context) => {
        CurrentThemeApp.light: context.lcz.themeSettingsLight,
        CurrentThemeApp.dark: context.lcz.themeSettingsDark,
      };
}
