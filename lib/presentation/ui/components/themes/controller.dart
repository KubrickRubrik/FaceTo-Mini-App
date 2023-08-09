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
    };
  }

  // All available themes
  static Map<CurrentThemeApp, String> defaultThemes(BuildContext context) => {
        CurrentThemeApp.light: context.lcz.themeSettingsLight,
        CurrentThemeApp.dark: context.lcz.themeSettingsDark,
      };

  static T getThemeData<T>({required TypeThemeComponent component, required CurrentThemeApp val}) {
    switch (component) {
      case TypeThemeComponent.appBarBackground:
        return switch (val) {
          CurrentThemeApp.light => const Color(0xFFFFFFFF) as T,
          CurrentThemeApp.dark => const Color(0xFF1b1e53) as T,
        };
      case TypeThemeComponent.appBarContent:
        return switch (val) {
          CurrentThemeApp.light => const Color(0xFF745291) as T,
          CurrentThemeApp.dark => const Color(0xFFFFFFFF) as T,
        };
      case TypeThemeComponent.seriesPage:
        return switch (val) {
          CurrentThemeApp.light => [const Color(0xFF745291), const Color(0xFF1b1e53)] as T,
          CurrentThemeApp.dark => [const Color(0xFF48335A), const Color(0xFF0B0D23)] as T,
        };
      case TypeThemeComponent.series:
        return switch (val) {
          CurrentThemeApp.light => const Color(0xFFeeeeee) as T,
          CurrentThemeApp.dark => const Color(0xFF000000) as T,
        };
      case TypeThemeComponent.scenesBackground:
        return switch (val) {
          CurrentThemeApp.light => [const Color(0xFFFFD500), const Color(0xFFFE7B00)] as T,
          CurrentThemeApp.dark => [const Color(0xFF002856), const Color(0xFF0060CD), const Color(0xFF000D1C)] as T,
        };
      case TypeThemeComponent.scenesBanner:
        return switch (val) {
          CurrentThemeApp.light => const Color(0xFFFFFFFF) as T,
          CurrentThemeApp.dark => const Color(0xFF002856) as T,
        };
      case TypeThemeComponent.scenesStatBackground:
        return switch (val) {
          CurrentThemeApp.light => const Color(0xFF313131) as T,
          CurrentThemeApp.dark => const Color(0xFFeeeeee) as T,
        };
      case TypeThemeComponent.scenesStatContent:
        return switch (val) {
          CurrentThemeApp.light => const Color(0xFFFFFFFF) as T,
          CurrentThemeApp.dark => const Color(0xFF313131) as T,
        };
    }
    ;
  }
}
